<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>11_sing-up</title>
</head>
<body>
	<!-- id pwd 비번확인 이름 나이 입력받아서 -->
	<!-- submit 진행시 12_sing-up-result.jsp 로 보내기 -->
	<!-- 모든값에 빈값은 X -->
	<!-- 비밀번호와 비번확인은 같은 값이여야함 -->
	
	<!-- 12_sing 에서 받은 값 출력 -->
	<!-- 아이디 : 000 , 이름 : 000 ,... -->
	
	<form action="12_sing-up-result.jsp" method="get" name="singUp"> 
		<div>
			<label>아이디 : <input name="userId"></label>
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
			<label>나이 : <input name="userAge"></label>
		</div>
		
		<div>
			<input type="button" value="가입" onclick="fnsingUp()">
		</div>
	</form>
	
</body>
</html>
<script>
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
		if(singUp.userAge.value.length == 0){
			alert("나이입력하세요");
			singUp.userAge.focus(); 
			return;
		}
		
		
		
		/* 위 조건을 모두 만족했을떄 최종 submit(action 페이지 호출) */
		singUp.submit();
	}
</script>