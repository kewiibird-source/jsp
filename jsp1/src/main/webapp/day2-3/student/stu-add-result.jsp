<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>stu-add-result.jsp</title>
</head>
<body>
	<!-- 학생삽입결과 -->
	<%@ include file="../../db.jsp" %>
	<%
		String stuNo = request.getParameter("stuNo");
		/* input의 키값인 name="stuNo" 으로 받아야한다 */
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		String stuGrade = request.getParameter("stuGrade");
		
		String sql = "INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT, STU_GRADE)"
				+ " VALUES('" + stuNo + "','" + stuName + "','" + stuDept + "','" + stuGrade + "')";
		int result = stmt.executeUpdate(sql);
		if(result > 0){
			response.sendRedirect("stu-list.jsp");
		} else {
			out.println("오류발생");
		}
	%>
</body>
</html>