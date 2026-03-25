<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_board-edit-result.jsp</title>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<%
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String kind = request.getParameter("kind");
		String boardNo = request.getParameter("boardNo");
	
		String sql = "UPDATE TBL_BOARD SET "
					+ "TITLE = '" + title + "',"
					+ "CONTENTS = '" + contents + "',"
					+ "KIND = '" + kind + "',"
					+ "UDATETIME = SYSDATE "
					+ "WHERE BOARDNO = " + boardNo;
		/* out.println(sql); */
		
		int result = stmt.executeUpdate(sql);
	%>
</body>
</html>
<script>
	let result = <%= result %>
	if(result > 0){
		alert("수정됐다");
	} else {
		alert("수정안됐따");
	}
	location.href = "03_board-list.jsp"
</script>