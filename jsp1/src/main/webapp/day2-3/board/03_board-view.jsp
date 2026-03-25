<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03 board-view</title>
</head>
<style>
	body { margin : 30px; }
	table, th, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse : collapse;
	}
	th { width : 50px; }
	td { width : 300px; }
	.contents { height : 200px }
	.btn-area { margin-top : 5px }
	.line {
		margin : 30px 0px;
		border-bottom : 1px solid #ccc;
	}
</style>
<body>
	<%@ include file="../../db.jsp" %>
<form action="" name="form">
	<%
		String sessionId = (String) session.getAttribute("sessionId");
		String sessionRole = (String) session.getAttribute("sessionRole");
		String boardNo = request.getParameter("boardNo");
	%>
	<table>
		<input name="boardNo" value ="<%= boardNo %>" hidden>
	<%
		/* 조회수 증가, 새로고침했을때 숫자가 계속 증가됨! => 나중에 캐시등등 배워야함 */
		String sql = "UPDATE TBL_BOARD SET CNT = CNT + 1 "
					+ "WHERE BOARDNO = " + boardNo;
		stmt.executeUpdate(sql);
		
		
		sql = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
		ResultSet rs = stmt.executeQuery(sql);
		String userId = "";
		if(rs.next()){
			userId = rs.getString("USERID");
	%>
		<tr>
			<th>제목</th>
			<td colspan="3"><%= rs.getString("TITLE") %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= rs.getString("USERID") %></td>
			<th>조회수</th>
			<td><%= rs.getString("CNT") %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td colspan="3"><%= rs.getString("CDATETIME") %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" class="contents"><%= rs.getString("CONTENTS") %></td>
		</tr>
	<% 	
		} else {
			out.println("게시글 존재하지 않음");
		}
	%>
	</table>
	<div class="btn-area">
	<% 	
		if(userId.equals(sessionId) || sessionRole.equals("A")){
	%>
		<input type="button" value="수정" onclick="fnEdit()">
		<input type="button" value="삭제" onclick="fnRemove()">
	<% 	
		} 
	%>
		
		<a href="03_board-list.jsp"><input type="button" value="되돌아가기"></a>		
	</div>
	<div>
		<div class="line">
	</div>
	<div class="comment-area">
		<table>
		<%
			sql = "SELECT * FROM TBL_COMMENT WHERE BOARDNO = " + boardNo
				+ " ORDER BY CDATETIME ASC";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
		%>
			<tr>
				<th><%= rs.getString("USERID") %></th>
				<td><%= rs.getString("CONTENTS") %></td>
			</tr>
		<% 	
			}
		%>
		</table>
		<table>
			<tr>
				<th>댓글등록</th>
				<td>
					<textarea name="contents" cols="50" rows="5"></textarea>
				</td>
				<td>
					<input type="button" value="등록" onclick="fnCommentAdd()">
				</td>
			</tr>
		</table>
	</div>
</form>
</body>
</html>
<script>
	function fnEdit(){
		let form = document.form;
		form.action = "03_board-edit.jsp"
		form.submit();
	}
	function fnRemove(){
		/* let form = document.form;		
		form.action = "03_board-remove.jsp"
		form.submit(); */
		console.log(<%= boardNo %>);
		location.href = "03_board-remove.jsp?boardNo=" + <%= boardNo %>;
	}
	function fnCommentAdd(){
		let form = document.form;
		form.action = "03_board-comment-add.jsp"
		form.submit();
	}

</script>