<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>offset(paging)</title>
<style>
	#container{
		width : 800px;
		margin : 80px auto;
	}
	table{
		width : 100%;
		margin : 0 auto;
	}
	.select-area{
		text-align: right;
		margin-bottom : 5px; 
	}
	body { margin : 30px; }
	table, th, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
		text-align: center;
	}
	th { background-color: #eee; }
	.paging-area {
		margin-top : 5px;
		text-align: center
	}
	.paging-area a {
		padding : 5px;
		text-decoration: none;
		color : #4c4848;
		font-size: 17px;
	}
	.paging-area .active{
		font-weight: bold;
		color : black;
	}
	tr .title {
		text-align : left;
		width : 40%;
	}
	.comment-cnt { 
		color : blue; 
		font-weight : bold;
	}
	.search-area { 
		margin : 10px 0px;
		text-align : center;	
	}
</style>
</head>
<body>
<div id="container">
	<form action="board-list-paging.jsp" name="form">
		<%@ include file="../../db.jsp" %>
		<%	
			/* 한페이지에 나타낼 항목개수 5개(디폴트) */
			int pageSize = 5;
			if(request.getParameter("pageSize") != null){
				pageSize = Integer.parseInt(request.getParameter("pageSize"));
			}
			String keyword = request.getParameter("keyword");
			
		%>
		<div class="search-area">
		<label>검색어 : <input name="keyword" value="<%= keyword != null ? keyword : "" %>"></label>
		<input type="submit" value="검색">
		</div>
		<div class="select-area">
			<select name="pageSize" onchange="fnPageSize()">
				<%
					int arr[] = {3, 5, 10, 15, 20};
					for(int i=0; i<arr.length; i++){
				%>
						<option value="<%= arr[i] %>" <%= pageSize == arr[i] ? "selected" : "" %>> <%= arr[i] %> 개씩 </option>
				<%		
					}
				%>
			</select>
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		<%	
			/* 검색 키워드 값에 따라 total 값도 변경 */
			String cntSql = "SELECT COUNT(*) AS TOTAL FROM TBL_BOARD WHERE 1=1 ";
			if(keyword != null){
				cntSql += "AND TITLE LIKE '%" + keyword + "%' ";
			}
			
			/* 전체 페이지 수를 rsCnt에 담고 */
			ResultSet rsCnt = stmt.executeQuery(cntSql);	
			rsCnt.next();
			/* rsCnt에 담겨있는 TOTAL(40개)를 total에 넣음 */
			int total = rsCnt.getInt("TOTAL");
			/* 전체항목개수(40)/한페이지에 나타낼 항목개수 5개(디폴트) => 페이지 수  */
			int pageList = (int) Math.ceil((double) total / pageSize);
			
			/* 현재페이지 1(디폴트) 주소에 있는 page가 빈값이 아닐경우
			 들어있는값(문자열)을 숫자형태로 바꿔주고 현재페이지에 넣어준다 */
			int currentPage = 1; 
			if(request.getParameter("page") != null){
				currentPage = Integer.parseInt(request.getParameter("page"));
			}
			/* (현재페이지)-1 * (한페이지에 나타낼 항목개수 5개(디폴트)) */
			int offset = (currentPage - 1) * pageSize;
			/* out.println(offset); */
			
			
			String sql = /* 댓글개수 comment_cnt에서 조인하기 */
			    "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') AS CDATE, NVL(COMMENT_CNT, 0) AS COMMENT_CNT " +
			    "FROM TBL_BOARD B " +
			    "LEFT JOIN ( " +
			    "    SELECT COUNT(*) AS COMMENT_CNT, BOARDNO " +
			    "    FROM TBL_COMMENT " +
			    "    GROUP BY BOARDNO " +
			    ") T ON B.BOARDNO = T.BOARDNO " +
			    "WHERE 1=1 ";
			
			/* 검색창에서 검색했을때 최초(null)이 아닐시 sql 조건 추가 */
			if(keyword != null){
				sql += "AND TITLE LIKE '%" + keyword + "%' ";
			}
			if(true){
				sql += "ORDER BY B.BOARDNO ASC ";	
			}
			if(true){
				sql += "OFFSET " + offset + " ROWS FETCH NEXT " + pageSize + " ROWS ONLY";
			}
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
		%>
				<tr>
					<td><%= rs.getString("BOARDNO") %></td>
					<td class="title">
						<%= rs.getString("TITLE") %> 
						<% if(rs.getInt("COMMENT_CNT") != 0){ %> <!-- comment_cnt가 0이아닐때만 표시 -->
						<span class="comment-cnt">[ <%= rs.getInt("COMMENT_CNT") %> ]</span>
						<% } %>
					</td>
					<td><%= rs.getString("USERID") %></td>
					<td><%= rs.getString("CNT") %></td>
					<td><%= rs.getString("CDATE") %></td>
				</tr>	
		<%		
			}
		%>
		</table>
		<div class="paging-area">
			<% if(currentPage != 1){ %>
				<a href="?page=<%= currentPage-1 %>&pageSize=<%= pageSize %>&keyword=<%= keyword %>">◀</a> <!-- 누르면 현재페이지 -1 대신 1페이지에서는 안보이기 -->
			<% } %>
			<%
				for(int i=1; i<=pageList; i++){
			%>
				<a href="?page=<%= i %>&pageSize=<%= pageSize %>&keyword=<%= keyword %>" class="<%= currentPage == i ? "active" : "" %>"> <%= i %> </a>
			<%		
				}
			%>
			<% if(currentPage != pageList){ %>
			<a href="?page=<%= currentPage+1 %>&pageSize=<%= pageSize %>&keyword=<%= keyword %>">▶</a> <!-- 누르면 현재페이지 -1 대신 1페이지에서는 안보이기 -->
			<% } %> <!-- 누르면 현재페이지 +1 대신 마지막 페이지에서는 안보이기 -->
		</div>
	</form>
</div>
</body>
</html>
<script>
	function fnPageSize(){
		document.form.submit();
	}
	
</script>
