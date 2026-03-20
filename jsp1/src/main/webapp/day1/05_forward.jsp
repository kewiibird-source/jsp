<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="forward-view.jsp">
		<jsp:param name="userId" value="hong12"/>
		<jsp:param name="age" value="32"/>
	</jsp:forward>
</body>
</html>