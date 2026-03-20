<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_login-result.jsp</title>
</head>
<body>

	<form action="login-result.jsp" method="get"> 
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input name="pwd" type="password"></label>
		</div>
		
		<div>
			<input type="submit" value="로그인!">
		</div>
	</form>
	
</body>
</html>