<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10</title>
</head>
<body>

	<form action="09_loginResult.jsp" name="login" method="get"> 
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input name="pwd" type="password"></label>
		</div>
		
		<div>
			<input type="button" value="로그인!" onclick="fncheck()">
		</div>
	</form>
	
</body>
</html>
<script>
	function fncheck(){
		let login = document.login; // form태그 안 action의 name
		/* console.log(login.userId.value); */
		if(login.userId.value.length == 0){
			alert("아이디입력하세요");
			login.userId.focus(); 
			return;
		}
		if(login.pwd.value.length == 0){
			alert("비번입력하세요");
			login.pwd.focus(); 
			return;
		}
		/* 위 조건을 모두 만족했을떄 최종 submit(action 페이지 호출) */
		login.submit();
	}
</script>