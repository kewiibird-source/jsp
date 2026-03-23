<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>student-search-result.jsp</title>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<%
		String stuNo = request.getParameter("stuNo");
		out.println(stuNo);
		
		String sql = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			out.println("해당 학생의 이름은 " + rs.getString("STU_NAME") + "입니다");
		} else {
			out.println("학생 조회 실패!!!");
		}		
	%>
</body>
</html>