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
		<div>
			<label>학번 : <input name="stuNo"></label>
		</div>
		<div>
			<label>이름 : <input name="stuName"></label>
		</div>
		<div>
			<label>학과 : <input name="stuDept"></label>
		</div>
		<div>
			<label>학년 : 
				<select name="stuGrade">
					<option value="1"> 1 </option>
					<option value="2"> 2 </option>
					<option value="3"> 3 </option>
				</select>
			</label>
		</div>
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