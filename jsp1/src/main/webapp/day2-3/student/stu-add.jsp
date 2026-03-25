<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	select {
	    width: 50px;
		text-align: center;	
	}
	input[readOnly]{
		background-color : #eee;
		border-color : white;
	}
	
</style>
</head>
<body>
	
	<form action="stu-add-result.jsp" name="form">
		<div>
			<label>학번 : <input name="stuNo"></label>
			<input type="button" onclick="fnCheck()" value="중복체크">
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
			<input type="button" value="추가" onclick="fnAdd()">
		</div>
	</form>
</body>
</html>
<script>
	let addFlg = "N"
	function fnAdd(){
		let form = document.form;
		if(addFlg == "N"){
			alert("중복체크후 추가하셈");
			return;
		}	
		form.submit();
	}

	function fnCheck(){
		/* student-check.jsp */
		let form = document.form;
		let stuNo = form.stuNo.value;
		id(stuNo.length != 8){
			alert("학번은 8글자!");
			return;
		}
		
		window.open("student-check.jsp?stuNo="+stuNo ,"check" ,"width=400, height=400");
	}
	function fnReturn(flg){
		let form = document.form;
		
		if(flg == 'Y'){
			form.stuNo.readOnly = only;
			addFlg = flg;
		}
	}
</script>





