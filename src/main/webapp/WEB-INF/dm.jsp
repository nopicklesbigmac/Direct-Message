
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html style="height: 920px">
<head>
<link href="../dm.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<!-- <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.css"
    /> -->

</head>
<body>
	<div class="main-section">
		<div class="head-section">
			<div class="headLeft-section">
				<div class="headLeft-sub">
					<input type="text" name="search" placeholder="Search..." />
					<button>
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
			<div class="headRight-section">
				<div class="headRight-sub" >
					<img style="margin:auto; float:left; width: 40px; height: 40px;" src="/image/profile/default.jpg" />
					<h3 style="margin-top:7px; margin-left:50px;">
						${receiver}	
					</h3>
				
				</div>
			</div>
		</div>
		<div class="body-section">
			<div class="left-section mCustomScrollbar" id="f7Bj3"
				data-mcs-theme="minimal-dark">
				<ul>
				<c:forEach var="left_msg" items="${left_msg}" varStatus="status">
								<c:choose>
								<c:when test="${left_msg.sender eq sessionScope.Sender}">
									<c:set var="receiver_left" value="${left_msg.receiver}"></c:set>
								</c:when>
								<c:otherwise> 
									<c:set var="receiver_left" value="${left_msg.sender}"></c:set>
								</c:otherwise>
								</c:choose>
					<li class="msg_rcv" value="${receiver_left}">
						<div class="chatList">
							<div class="img">
								<!--접속중 표시 <i class="fa fa-circle"></i> -->
							
								<img src="/image/profile/default.jpg" />
							</div>
							<div class="desc">
								<small class="time">
								<fmt:formatDate value="${left_msg.timestamp}" pattern="hh:mm" /> 
								<fmt:formatDate value="${left_msg.timestamp}" pattern="a" var="fdate" />
								<c:if test="${fdate eq '오후'}">pm</c:if>
								<c:if test="${fdate eq '오전'}">am</c:if>
								</small>
								<h5>
								${receiver_left}
								</h5>
								<small>${left_msg.content}</small>
							</div>
						</div>
					</li>
				</c:forEach>

				</ul>
			</div>
			<div class="right-section">
				<div class="message mCustomScrollbar" data-mcs-theme="minimal-dark">
					<ul class="msg-ul">
						<c:forEach var="message" items="${messages}" varStatus="status">
						<c:if test="${receiver eq message.sender || receiver eq message.receiver}">
							<fmt:formatDate value="${messages[status.index - 1].timestamp}" pattern="yyyy-MM-dd" var="y-day" />
							<fmt:formatDate value="${message.timestamp}" pattern="yyyy-MM-dd" var="x-day" />
							<c:if
								test="${status.first || (x-day != y-day && status.count > 1)}">
								<li class="msg-day">
									<small>
										<fmt:formatDate value="${message.timestamp}" pattern="yyyy-MM-dd" />
									</small>
								</li>
							</c:if>
							<c:choose>
								<c:when test="${message.sender eq sessionScope.Sender}">
									<li class="msg-right">
								</c:when>
								<c:otherwise> 
									<li class="msg-left">
								</c:otherwise>
							</c:choose>
										<div class="msg-left-sub">
											<img src="/image/profile/default.jpg" />
											<div class="msg-desc">${message.content}</div>
											<small> 
											<fmt:formatDate value="${message.timestamp}" pattern="hh:mm" /> 
											<fmt:formatDate value="${message.timestamp}" pattern="a" var="fmtdate" />
												<c:if test="${fmtdate eq '오후'}">pm</c:if>
												<c:if test="${fmtdate eq '오전'}">am</c:if>
											</small>
										</div>
									</li>
									</c:if>
						</c:forEach>
					</ul>
					<ul style="height: 70px">
					</ul>
				</div>
				<div class="right-section-bottom">
					<form action="/send?value=${receiver}" method="post">
						<input style="display: none;" type="text" name="receiver" placeholder="Receiver username" value="${receiver}" required>
						<div class="upload-btn">
							<button class="btn">
								<i class="fa fa-photo"></i>
							</button>
							<input type="file" name="myfile" />
						</div>
						<input type="text"  name="content" placeholder="type here..."
							required>
						<button type="submit" class="btn-send">
							<i class="fa fa-send"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- custom scrollbar plugin -->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script> -->
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    const listItems = document.querySelectorAll('.msg_rcv'); // class로 선택

    listItems.forEach(function(item) {
        item.addEventListener('click', function() {
            const value = this.getAttribute('value'); // value 속성값 가져오기
            const url = `/dm/value?value=`+value; // URL 생성
            window.location.href = url; // URL로 이동
			
        });
    });
});
window.onload = function() {
    var chatContainers = document.getElementsByClassName('message mCustomScrollbar'); // 클래스 선택
    if (chatContainers.length > 0) {
        var chatContainer = chatContainers[0]; // 첫 번째 요소 선택
        chatContainer.scrollTop = chatContainer.scrollHeight;
    }
    
};
</script>
</body>
</html>