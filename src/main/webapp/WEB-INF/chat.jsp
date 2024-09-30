
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Chat</title>
   
</head>
<body >
    <div id="chat">
        <input type="text" id="sender" placeholder="발신자 이름 입력">
        <input type="text" id="receiver" placeholder="수신자 이름 입력">
        <input type="text" id="message" placeholder="메시지를 입력하세요">
        <button onclick="sendMessage()">전송</button>
        <div id="messages">
            <c:forEach var="msg" items="${messages}">
                <div>${msg.sender_username}: ${msg.content}</div>
            </c:forEach>
        </div>
    </div>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    
    <script>
        var stompClient = null;

        function connect() {
            var socket = new SockJS('/chat');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function (frame) {
                console.log('Connected: ' + frame);
                stompClient.subscribe('/topic/messages', function (message) {
                	 const parsedMessage = JSON.parse(message.body);
                     console.log("수신된 메시지:", parsedMessage);
                     showMessage(parsedMessage);
                });
            }, function (error) {
                console.error('Error connecting to WebSocket:', error);  // 연결 오류 로그
            });
        }

        function sendMessage() {
            const message = {
            	sender_username: document.getElementById('sender').value,
            	receiver_username: document.getElementById('receiver').value,
                content: document.getElementById('message').value
            };
            stompClient.send("/app/sendMessage", {}, JSON.stringify(message));
            document.getElementById('message').value = '';
        }

        function showMessage(message) {
            const messagesDiv = document.getElementById('messages');
            messagesDiv.innerHTML += "<div>" + message.sender_username + " -> " + message.receiver_username + ": " + message.content + "</div>";
            
        }

        connect();
    </script>
</body>
</html>
