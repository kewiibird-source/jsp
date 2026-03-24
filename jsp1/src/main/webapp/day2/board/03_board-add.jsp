<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_board-add.jsp</title>
</head>
<style>
	body { margin : 30px; }
	table, th, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse : collapse;
		text-align : center;
	}
	th { width : 50px; }
	td { width : 300px; }
	input[type='text'] { width : 280px; }
	
</style>
<body>
	<form action="03_board-add-result.jsp" name="form">
		<table>
			<tr>
				<th>종 류</th>
				<td>
					<label><input name="kind" value="1" type="radio" checked>공지사항</label>
					<label><input name="kind" value="2" type="radio">자유게시판</label>
					<label><input name="kind" value="3" type="radio">문의게시판</label>
				</td>
			</tr>
			<tr>
				<th>제 목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea rows="10" cols="40" name="contents"></textarea></td>
			</tr>
		</table>
		<div>
			<input type="button" value="작성" onclick=fnAdd()>
			<input type="reset" value="초기화">
			<!-- form 안에 있는 태그들을 대상으로 초기화 -->
			<a href="03_board-list.jsp"><input type="button" value="되돌아가기"></a>		
		
	</form>
</body>
</html>
<script>
	function fnAdd(){
		let form = document.form; 
		if(form.title.value.length == 0 || form.contents.value.length == 0){
			alert("제목및내용입력하삼");
			return;
		} 
		form.submit();	
		
	}
</script>