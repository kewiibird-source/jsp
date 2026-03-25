<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_sing-up</title>
</head>
<body>
	<form action="sing-up-result.jsp" method="get" name="singUp"> 
		<div>
			<label>아이디 : <input name="userId"></label>
			<input type="button" value="중복체크" onclick="fnCheck">
		</div>
		<div>
			<label>비밀번호 : <input name="pwd" type="password"></label>
		</div>
		<div>
			<label>비밀번호 확인 : <input name="pwdCheck" type="password"></label>
		</div>
		<div>
			<label>이름 : <input name="userName"></label>
		</div>
		<div>
			성별 
			<label> : <input type="radio" name="gender" value="M" checked>남자</label>
			<label> : <input type="radio" name="gender" value="F">여자</label>
		</div>

		<div>
			<input type="button" value="가입" onclick="fnsingUp()">
		</div>
	</form>
	
</body>
</html>
<script>
	function fnCheck(){
		let form = document.form;
		let userId = form.userId.value;

		window.open("student-check.jsp?stuNo="+stuNo ,"check" ,"width=400, height=400");
	}
	
	function fnsingUp(){
		let singUp = document.singUp; // form태그 안 action의 name
		/* console.log(singUp.userId.value); */
		if(singUp.userId.value.length == 0){
			alert("아이디입력하세요");
			singUp.userId.focus(); 
			return;
		}
		if(singUp.pwd.value.length == 0){
			alert("비번입력하세요");
			singUp.pwd.focus(); 
			return;
		}
		
		if(singUp.pwd.value != singUp.pwdCheck.value){
			alert("비번확인하삼");
			singUp.pwdCheck.focus(); 
			return;
		}
		
		
		if(singUp.userName.value.length == 0){
			alert("이름입력하세요");
			singUp.userName.focus(); 
			return;
		}
		
		/* 위 조건을 모두 만족했을떄 최종 submit(action 페이지 호출) */
		singUp.submit();
	}
</script>