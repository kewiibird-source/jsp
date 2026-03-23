<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_board-remove.jsp</title>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<!-- 삭제 구현하기 -->
	<%
		String boardNo = request.getParameter("boardNo");
		
		String sql = "DELETE FROM TBL_BOARD WHERE BOARDNO = '" + boardNo + "'";
		int result = stmt.executeUpdate(sql);
		if(result > 0){
			out.println("삭제됐음");
		} else {
			out.println("삭제안됐음");
		}
	%>
	<a href="03_board-list.jsp"><button>되돌아가기</button></a>
</body>
</html>