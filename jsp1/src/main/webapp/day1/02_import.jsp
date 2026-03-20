<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02 import</title>
</head>
<body>
	<!-- 다른 패키지에 있는 클래스를 사용하기 위해서는 import 해야 한다. -->
	<!-- 자바랑 작성하는 방법은 차이가 있음. 자동완성 안해줌 -->
	<%@ page import="java.util.Date" %>
	<%= new Date().toLocaleString() %>
</body>
</html>