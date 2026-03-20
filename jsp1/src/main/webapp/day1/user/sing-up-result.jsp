<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_sing-up-result.jsp</title>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String userName = request.getParameter("userName");
		String gender = request.getParameter("gender");
		
		/* String sql = "INSERT INTO TBL_USER(USERID, PWD, USERNAME, GENDER) "
					+ "VALUES (\'%s\',\'%s\',\'%s\',\'%s\')".formatted(userId, pwd, userName, gender); */
		String sql = String.format(
				"INSERT INTO TBL_USER(USERID, PWD, USERNAME, GENDER) VALUES('%s','%s','%s','%s')", userId, pwd, userName, gender);
					
					
		/* System.out.println(sql); */
		int result = stmt.executeUpdate(sql);
		if(result > 0){
			out.println("가입ㅊㅊ");
		} else {
			out.println("오류 ㅄ");
		}
	%>

</body>
</html>