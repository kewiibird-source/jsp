<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login-result.jsp</title>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<!-- login-result.jsp -->
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		out.println(userId + " " + pwd);
		
		/* String sql = "SELECT * FROM TBL_USER WHERE USERID = '" 
					+ userId + "' AND PWD = '" + pwd + "'"; */
		
		String sql = String.format(
				"SELECT * FROM TBL_USER WHERE USERID = '%s' AND PWD = '%s'", userId, pwd);
					
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			out.println("로그인 성공");
			/* session!! */
			String sessionId = rs.getString("USERID");
			String sessionRole = rs.getString("ROLE");
			
			session.setAttribute("sessionId", sessionId);
			session.setAttribute("sessionRole", sessionRole);
			session.setMaxInactiveInterval(60 * 10); /* 로그인 유지시간!! 30분 */
			
			response.sendRedirect("03_board-list.jsp");
		} else {
			out.println("로그인 실패");
		}
				
	%>
	
	
</body>
</html>