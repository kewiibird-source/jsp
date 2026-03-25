<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>offset(paging)실습2</title>
<style>
	#container{
		width : 800px;
		margin : 10px auto;
	}
	table{
		width : 100%;
		margin : 0 auto;
	}
	.select-area{
		text-align: right;
		margin-bottom : 5px; 
	}
	body {
		margin : 30px;
	}
	table, th, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
		text-align: center;
	}
	th {
		background-color: #eee;
	}
</style>
</head>
<body>
<div id="container">
	<form action="paging실습2.jsp" name="form">
		<%@ include file="../../db.jsp" %>
		<div class="select-area">
			<select name="pageSize">
				<%
					int arr[] = {3, 5, 10, 15, 20};
					for(int i=0; i<arr.length; i++){
				%>
						<option value="<%= arr[i] %>"> <%= arr[i] %> 개씩 </option>
						<!-- 드랍다운 옵션을 배열 안에 있는 숫자로 채웠음 -->
				<%		
					}
				%>
			</select>
		</div>
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>학년</th>
			</tr>
		<%	
			
			String sql = "SELECT * "
						+ "FROM STUDENT S WHERE 1=1 ";
			if(true){
				sql += "ORDER BY STU_NO ASC ";	/* 정렬 */
			}
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
		%>
				<tr>
					<td><%= rs.getString("STU_NO") %></td>
					<td><%= rs.getString("STU_NAME") %></td>
					<td><%= rs.getString("STU_DEPT") %></td>
					<td><%= rs.getString("STU_GRADE") %></td>
				</tr>	
		<%		
			}
		%>
		</table>
		<div class="paging-area">
		</div>
	</form>
</div>
</body>
</html>
<script>
</script>