<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03 board-list</title>
</head>
<style>
	body { margin : 30px; }
	table, th, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse : collapse;
		text-align : center;
	}
	.search-area { margin : 10px 0px; }
</style>
<body>
<form action="03_board-list.jsp" name="form">
	<%@ include file="../../db.jsp" %>
	<%
		String sessionId = (String) session.getAttribute("sessionId");
		/* session은 object 타입이라 string으로 다운캐스팅 해줌 */
		String sessionRole = (String) session.getAttribute("sessionRole");
		String keyword = request.getParameter("keyword");
		
		String kind = request.getParameter("kind");
		kind = kind != null ? kind : "";
	%>
	<div>
		<div>현재 로그인한 사용자 : <%= sessionId %></div>
	</div>
	<div class="search-area">
		<label>검색어 : <input name="keyword" value="<%= keyword != null ? keyword : "" %>"></label>
		<input type="submit" value="검색">
		<select name = "kind"  onchange="fnKind()">
			<option value=""> :: 전체 :: </option>
			<option value="1" <%= kind.equals("1") ? "selected" : "" %>> :: 공지사항 :: </option>
			<option value="2" <%= kind.equals("2") ? "selected" : "" %>> :: 자유게시판 :: </option>
			<option value="3" <%= kind.equals("3") ? "selected" : "" %>> :: 문의게시판 :: </option>
		</select>
	</div>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
			<th>삭제</th>
		</tr>
	<%
		/* String keyword = request.getParameter("keyword"); */
		
		String sql = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') " 
					+ "AS CDATE FROM TBL_BOARD B WHERE 1=1 ";
		
		if(keyword != null){
			sql += "AND TITLE LIKE '%" + keyword + "%' ";
		}
		if(kind != null && !kind.equals("")){			
			sql += "AND KIND = " + kind + " ";
		}
		if(true){			
			sql += "ORDER BY BOARDNO ASC";
			/* 게시글 정렬 */
		}
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			String userId = rs.getString("USERID");
	%>		
		<tr>
			<td><%= rs.getString("BOARDNO") %></td>
			<td>
				<a href="javascript:;" onclick="fnView(<%= rs.getString("BOARDNO") %>)">
					<%= rs.getString("TITLE") %>
				</a>
			</td>
			<td><%= rs.getString("USERID") %></td>
			<td><%= rs.getString("CNT") %></td>
			<td><%= rs.getString("CDATE") %></td>
			<td>
				<% if(sessionId.equals(userId) || sessionRole.equals("A")){ %>
					<input type="button" value="삭제" onclick="fnRemove(<%= rs.getString("BOARDNO") %>)">
				<% } %>
			</td>
		</tr>
	<% 	
		}
	%>

	</table>
	<div>
		<input type="button" value="글쓰기" onclick="fnAdd()">
	</div>
</form>
</body>
</html>
<script>
	function fnAdd(){
		// board-add.jsp
		location.href = "03_board-add.jsp"
	}
	function fnView(boardNo){
		/* alert(boardNo); 확인용 */
		location.href = "03_board-view.jsp?boardNo=" + boardNo;
	}
	function fnKind(v){
		/* let form = document.form;
		form.submit(); */
		document.form.submit();
	}
	function fnRemove(boardNo){
		location.href = "03_board-remove.jsp?boardNo=" + boardNo;
	}
</script>