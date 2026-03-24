<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_login</title>
</head>
<body>
	<!-- 03_login -->
	<form action="03_login-result.jsp" method="get" name="login">
		<div>
			아이디 : <input name="userId">
		</div>
		<div>
			비밀번호 : <input name="pwd" type="password">
		</div>
		<div>
			<input type="button" value="로그인" onclick="fnLogin()">
		</div>
	</form>
</body>
</html>
<script>
	function fnLogin(){
		let form = document.login;
		/* alert(form.userId.value);  */
		/* form태그 안의 userId의 value 값 */
		
		if(form.userId.value.length == 0){
			alert("아이디입력하세욤");
			return;
		}
		if(form.pwd.value.length == 0){
			alert("비밀번호입력하세욤");
			return;
		}
		
		form.submit();
		
	}
</script>