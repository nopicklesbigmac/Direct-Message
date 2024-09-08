<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />

<center>
<form action="${root }modifyProc" method="post">
<input type="hidden" name="no" value="${board.no }"/>
<table style="width: 650px; ">
	<tr>
		<td style="width: 80px; height:40px;" align="right">작성자</td>
		<td style="width: 570px; height:40px;">
			<input type=text name='id' value="${sessionScope.id }" disabled="disabled"/> 
		</td>
	</tr>
	<tr>
		<td  style="width: 80px; height:40px;" align="right">제 목</td>
		<td style="width: 570px; height:40px;">
			<input type=text name='title' style="width: 500px; " value="${board.title }"/> 
		</td>
	</tr>
	<tr>
		<td colspan=2 align="right">
		<textarea name="content" style="width: 650px; height: 300px">${board.content }
		</textarea></td>
	</tr>
	<!-- 파일의 수정 기능은 제공하지 않음. 삭제 후 다시 등록하면 됨. -->
	<tr>
		<td align='center' height=40 colspan=2>
			<input type=submit value='수정' style="width: 120px; "/>
			<input type=reset value='취소' style="width: 120px; "/>	 
		</td>
	</tr>
</table>
</form> 
</center>
