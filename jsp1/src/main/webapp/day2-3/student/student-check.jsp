<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<%
		String stuNo = request.getParameter("stuNo");
		String sql = "SELECT * FROM STUDENT WHERE STU_NO = " + stuNo;
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			out.println("이미 사용중인 학번임");
			out.println("<input id= 'check' value='N'> ");			
			
		} else {
			out.println("사용 가능한 학번임!");
			out.println("<input id= 'check' value='Y'> hidden");			
		}
	%>
	<input type="button" value="되돌아가기" onclick="fnClose()">
</body>
</html>
<script>
	function fnClose(){
		let flg = document.querySelector("#check").value;
		/* 자바스크립트로 input 박스 안 value 값 가져오기!! */
		window.opener.fnReturn(flg);
		/* opener => stu-add */
		window.close();
		
	}
</script>