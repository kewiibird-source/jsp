<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_board-comment-add.jsp</title>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<%
		String boardNo = request.getParameter("boardNo");
		String contents = request.getParameter("contents");
		String sessionId = (String) session.getAttribute("sessionId");
		
		String sql = String.format(
			"INSERT INTO TBL_COMMENT VALUES (%s, %s, '%s', '%s', %s, %s, %s)",
			"COMMENT_SEQ.NEXTVAL", boardNo, sessionId, contents, "NULL", "SYSDATE", "SYSDATE");
		int result = stmt.executeUpdate(sql);
		if(result > 0){
			response.sendRedirect("03_board-view.jsp?boardNo=" + boardNo);
		} else {
			out.println("오류발생");
		}
		
				
				
	%>
	
	
</body>
</html>