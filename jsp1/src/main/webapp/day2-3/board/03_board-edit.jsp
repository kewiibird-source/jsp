<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_board-edit.jsp</title>
</head>
<style>
	body { margin : 30px; }
	table, th, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse : collapse;
		text-align : center;
	}
	th { width : 50px; }
	td { width : 300px; }
	input[type='text'] { width : 280px; }
</style>
<body>
	<%@ include file="../../db.jsp" %>
	<%
		String boardNo = request.getParameter("boardNo");
		String sql = "SELECT * FROM TBL_BOARD WHERE BOARDNO = '" + boardNo + "'";
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			String kind = rs.getString("KIND");

	%>
		<form action="03_board-edit-result.jsp" name="form">
			<input name ="boardNo" value="<%= boardNo %>" hidden>
			<table>
				<tr>
					<th>종 류</th>
					<td>
						<label><input name="kind" value="1" type="radio" <%= kind.equals("1") ? "checked" : "" %>>공지사항</label>
						<label><input name="kind" value="2" type="radio" <%= kind.equals("2") ? "checked" : "" %>>자유게시판</label>
						<label><input name="kind" value="3" type="radio" <%= kind.equals("3") ? "checked" : "" %>>문의게시판</label>
					</td>
				</tr>
				<tr>
					<th>제 목</th>
					<td><input type="text" name="title" value=<%= rs.getString("TITLE") %>></td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea rows="10" cols="40" name="contents"><%= rs.getString("CONTENTS") %></textarea></td>
					<!-- input 태그는 닫는 태그가 없어서 value 값으로 넣어주지만 textarea는 닫는 태그가 있으니 태그와 태그 사이에 넣어준다 -->
				</tr>
			</table>
			<div>
				<input type="button" value="수정하기" onclick=fnEdit()>
				<input type="reset" value="초기화">
				<!-- form 안에 있는 태그들을 대상으로 초기화 -->
				<a href="03_board-list.jsp"><input type="button" value="되돌아가기"></a>		
			</div>
		</form>
	<%
	/* if문 트루일때 form태그 실행 */
		} else {
			out.println("데이터 조회 실패!");
		}
	%>
</body>
</html>
<script>
	function fnEdit(){
		let form = document.form; 
		if(form.title.value.length == 0 || form.contents.value.length == 0){
			alert("제목및내용입력하삼");
			return;
		} 
		form.submit();	
		
	}
</script>