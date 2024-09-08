
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>Chat</title>
</head>
<body>
	<h2>Chat Room</h2>
	<form action="/send" method="post">
		<input type="text" name="sender" placeholder="Your username" required>
		<input type="text" name="receiver" placeholder="Receiver username"
			required>
		<textarea name="content" placeholder="Type a message..." required></textarea>
		<button type="submit">Send</button>
	</form>
	<div>
		<h3>Messages</h3>
		<c:forEach var="message" items="${messages}" varStatus="status">
			<fmt:formatDate value="${messages[status.index - 1].timestamp}"
				pattern="yyyy-MM-dd" var="y-day" />
			<fmt:formatDate value="${message.timestamp}" pattern="yyyy-MM-dd"
				var="x-day" />
			<c:if test="${status.first || (x-day != y-day && status.count > 1)}">
				<fmt:formatDate value="${message.timestamp}" pattern="yyyy-MM-dd" />
			</c:if>
			<p>${message.sender.username}	=>	${message.receiver.username}:
				${message.content} / 
				<fmt:formatDate value="${message.timestamp}" pattern="hh:mm" />
				<fmt:formatDate value="${message.timestamp}" pattern="a"
					var="fmtdate" />
				<c:if test="${fmtdate eq '오후'}">pm</c:if>
				<c:if test="${fmtdate eq '오전'}">am</c:if>
			</p>
		</c:forEach>
	</div>
</body>
</html>