<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>09</title>
</head>
<body>
	<!-- id가 test / pwd가 1234면 로그인 성공 출력 -->
	<!-- 아니면 로그인 실패 -->
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		
		if(userId.equals("test") && pwd.equals("1234")){
			out.println("로그인 성공");
		} else {
			out.println("로그인 실패");
		}
		
		
	%>
	
	<%-- 로그인성공~~~~~~^^
	<div>아이디 : <%= userId %></div>
	<div>아이디 : <%= pwd %></div> --%>
</body>
</html>