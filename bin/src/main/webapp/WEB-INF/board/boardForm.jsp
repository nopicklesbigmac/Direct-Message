<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$("document").ready(function (){
		$("div.title").css("cursor", "pointer").click(function(){
			let no = $(this).attr("id");
			location.href='viewProc?writeNo=' + no;
/* 			$("#writeNo").val(no);
			$("#f").attr("action", "${root}viewProc");
			$("#f").submit(); */
		});


		$("#allSelect").click(function() {
			console.log(this.checked); // true or false
			$(".chkbox").prop('checked', this.checked);
			console.log($(".chkbox").length); // 선택된 개수 
		});
		
		$(".chkbox").click(function() {
			console.log($(".chkbox:checked").length); // 누적된 체크 수 
			if($(".chkbox:checked").length==3) // 출력된 게시글의 max(3개)
				$("#allSelect").prop('checked', true); // 전체선택 체크박스 체크 입력
			else
				$("#allSelect").prop('checked', false);
		});

	});
</script>
<center>
<form id="f" method="get" >
	<input type="hidden" id="writeNo" name="writeNo"/>
	<input type=hidden name="proc" value="deletes" />
	<input type=hidden name="formpath" value="delete" />
	
<table style="width: 650px; ">
	<thead>
	<tr>
		<th style="width: 40px; height:20px;" align="center">선택</th>
		<th style="width: 330px; height:20px;" align="center">제 목</th>
		<th style="width: 80px; height:20px;" align="center">작성자</th>
		<th style="width: 120px; height:20px;" align="center">작성일</th>
		<th style="width: 80px; height:20px;" align="center">조회수</th>
	</tr>
	</thead>
	<tr>
		<td style="width: 40px; height:20px;" align="center"><hr/></td>
		<td style="width: 330px; height:20px;" align="center"><hr/></td>
		<td style="width: 80px; height:20px;" align="center"><hr/></td>
		<td style="width: 120px; height:20px;" align="center"><hr/></td>
		<td style="width: 80px; height:20px;" align="center"><hr/></td>
	</tr>
	<c:forEach var="list" items="${boardList }">
		<tr>
			<td style="width: 40px; height:40px;" align="center">
				<input class="chkbox" name="checks" value="${list.no }" type="checkbox" />
			</td>
			<td style="width: 330px; height:40px;" align="center">
				<div id="${list.no }" class="title">${list.title }  </div>
			</td>
			<td style="width: 80px; height:40px;" align="center">${list.id }</td>
			<td style="width: 120px; height:40px;" align="center">${list.writeDate }</td>
			<td style="width: 80px; height:40px;" align="center">${list.hit } </td>
		</tr>
	</c:forEach>
	<tr><td colspan=5><hr/></td></tr>
	<tr>
		<td colspan=2><input type="checkbox" id="allSelect"/>전체선택</td>
		<td colspan=3 align="right">
			<!-- <input type="button" value='삭제' style="width: 100px; "/> -->
			<button formaction="${root }index" style="width: 100px; ">삭제</button>
			<input type="button" value='글쓰기' style="width: 100px;" onclick="location.href='${root }index?formpath=write'" />
		</td>
	</tr>
	<tr><td colspan=5><hr/></td></tr>
</table>
</form>

${page }
<form action="${root }boardProc" method="post">
	<table>
		<tr>
			<td>
				<select name="select">
					<option value="">전체</option>
					<option value="title">제목</option>
					<option value="id">작성자</option>
				</select>
				<input type=text name='search'/>
				<input type=button name='searchBtn' value='검색' style="width: 80px; "/>
			</td>
		</tr>
	</table>
</form>
</center>