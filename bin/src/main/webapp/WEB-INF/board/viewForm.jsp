<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />

<center>
<form action="" method="post">
	<input type="hidden" name="no" value="${board.no }" />
	<input type="hidden" name="id" value="${board.id }" />
	<input type="hidden" name="title" value="${board.title }"/>
	<input type="hidden" name="content" value="${board.content }"/>
	<input type=hidden name="proc" value="deleteProc" />
<table style="width: 650px; ">
	<tr>
		<td style="width: 300px; height:40px;" valign="middle"><h2>${board.title }</h2></td>
		<td style="width: 350px; height:40px;" align="right" valign="bottom">${board.writeDate }</td>
	</tr>
	<tr>
		<td colspan=2><hr/></td>
	</tr>
	<tr>
		<td  style="width: 300px; height:40px;" valign="top">${board.id }</td>
		<td style="width: 350px; height:40px;" align="right" valign="top">
			<c:if test="${board.fileName != '파일 없음' }">
				<a href="${root }download?fileName=${board.fileName }">${board.fileName }</a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan=2 style="width: 650px; height: 300px" valign="top">
		<pre>${board.content }</pre>
		</td>
	</tr>
	<tr>
		<td colspan=2><hr/></td>
	</tr>
	<tr>
		<td colspan=2 align="right">
			<input type=button style="width: 60px; " value='글쓰기' 
				onclick="location.href='${root}index?formpath=write'"/> 
			<button formaction="${root }index?formpath=modify" style="width: 60px; ">수정</button>
			<button formaction="${root }index?formpath=delete" style="width: 60px; ">삭제</button>
			<input type=button style="width: 60px; " value='목록' 
				onclick="location.href='${root}boardProc'"/>
		</td>
	</tr>
</table>
</form>
</center>