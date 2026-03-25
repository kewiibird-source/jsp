<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>stu-remove.jsp</title>
</head>
<body>
	<!-- 학생삭제 -->
	<%@ include file="../../db.jsp" %>
	<%
		String stuNo = request.getParameter("stuNo");
		
		String sql = "DELETE FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		int result = stmt.executeUpdate(sql);
		if(result > 0){
			out.println("삭제됐음");
		} else {
			out.println("삭제안됐음");
		}
	%>
	<a href="stu-list.jsp"><button>되돌아가기</button></a>
</body>
</html>