<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>08</title>
</head>
<body>
	<!-- jsp 핵심 => form 태그 -->
	<!-- form태그 내의 submit 버튼 클릭시 action페이지로 이동 -->
	<!-- 이때, form태그 내부에 있는 input에 있는 값을 request 객체에 담아서 이동한다 -->
	<!-- input의 name속성이 key, 입력받은 값이 value -->
	<!-- 09_loginResult.jsp?userId=test&pwd=1234 -->
	
	<!-- method는 옵션, get 방식(디폴트) / post 방식 -->
	<!-- get방식은 url(주소)에 값으 담아서 보낸다. 보안에 취약하지만 빠르다. -->
	<!-- 사용자 개인정보나 패스워드 전송할때는 사용하지 않는다 -->
	
	<!-- post방식은 데이터를 숨겨서 보낸다 -->
	
	<!-- 실습때는 데이터 확인용으로 get방식 쓸거임 -->
	<form action="09_loginResult.jsp" method="get"> 
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input name="pwd" type="password"></label>
		</div>
		
		<div>
			<!-- submit 버튼을 클릭하면 form태그의 action에 있는 페이지로 이동한다 -->
			<!-- submit은 action을 활성화 시킨다!! -->
			<input type="submit" value="로그인!">
		</div>
	</form>
	
</body>
</html>