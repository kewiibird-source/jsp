<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>stu-add.jsp</title>
</head>
<style>
	body { margin : 30px; }
	table, th, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse : collapse;
		text-align : center;
	}
</style>
<body>
	<!-- 학생삽입 -->
	<form action="stu-add-result.jsp" name="form">
		<table>
			<tr>
				<th>학 번</th>
				<td><input name="stuNo"></td>
			</tr>
			<tr>
				<th>이 름</th>
				<td><input name="stuName"></td>
			</tr>
			<tr>
				<th>학 과</th>
				<td><input name="stuDept"></td>
			</tr>
			<tr>
				<th>학 년</th>
				<td><input name="stuGrade"></td>
			</tr>
		</table>
		<div>
			<input type="button" value="학생추가" onclick=fnAdd()>
			<input type="reset" value="초기화">
			<!-- form 안에 있는 태그들을 대상으로 초기화 -->
			<a href="stu-list.jsp"><input type="button" value="되돌아가기"></a>		
		</div>
		
	</form>
</body>
</html>
<script>
	function fnAdd(){
		/* let form = document.form; 
		if(!form.stuNo.value.lenght == 8){
			alert("학번 8글자임");
			return;
		} */
		form.submit();
	}
</script>