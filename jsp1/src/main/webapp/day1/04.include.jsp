<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04.include</title>
</head>
<body>
	<!-- 헤더 파일 참조 -->
	<%@ include file="header.jsp" %>
	<hr>
	<div>메인 영역</div>
	<hr>
	<%@ include file="footer.jsp" %>
</body>
</html>