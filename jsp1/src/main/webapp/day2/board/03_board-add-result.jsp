<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_board-add-result.jsp</title>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<%
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String kind = request.getParameter("kind");
		String sessionId = (String) session.getAttribute("sessionId");
		
		/* 시퀀스 -> BOARD_SEQ.NEXTVAL
		아이디는 하드코딩 (user01~05)
		조회수는 0, 날짜는 SYSDATE */
		
		String sql = "INSERT INTO TBL_BOARD VALUES(" + 
					"BOARD_SEQ.NEXTVAL, '" + sessionId + "','" + title + "','" + contents + "',0," + kind + ", SYSDATE, SYSDATE)";
		/* out.println(sql); 쿼리확인용*/
		int result = stmt.executeUpdate(sql);
		if(result > 0){
			/* 게시글 목록으로 이동 : () 안에 있는 페이지로 이동시킴 */
			response.sendRedirect("03_board-list.jsp");
		} else {
			out.println("오류발생");
		}
		
	%>
</body>
</html>