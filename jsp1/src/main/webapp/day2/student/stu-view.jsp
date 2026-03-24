<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>stu-view.jsp</title>
</head>
<style>
	body { margin : 30px; }
	table, th, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse : collapse;
	}
	.btn-area { margin-top : 5px }
</style>
<body>
	<%@ include file="../../db.jsp" %>
	<!-- 학생상세보기 -->
<form action="" name="form">
	<%
		String stuNo = request.getParameter("stuNo");
		
	%>
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>학년</th>
		</tr>
	<%
		String sql = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("STU_NO") %></td>
			<td><%= rs.getString("STU_NAME") %></td>
			<td><%= rs.getString("STU_DEPT") %></td>
			<td><%= rs.getString("STU_GRADE") %></td>
		</tr>
	</table>
	<% 	
		} else {
			out.println("학생 존재하지 않음");
		}
	%>
	<input name="stuNo" value ="<%= stuNo %>" hidden>

	<div class="btn-area">
		<input type="button" value="수정" onclick="fnEdit()">
		<input type="button" value="삭제" onclick="fnRemove()">
		<a href="stu-list.jsp"><input type="button" value="되돌아가기"></a>		
	</div>
</form>
</body>
</html>
<script>
	function fnEdit(){
		let form = document.form;
		form.action = "stu-edit.jsp"
		form.submit();
	}
	function fnRemove(){
		<%-- console.log(<%= stuNo %>); --%>
		location.href = "stu-remove.jsp?stuNo=" + <%= stuNo %>;
	}

</script>