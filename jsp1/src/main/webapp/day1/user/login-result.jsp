<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_login-result</title>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<%
		/* 1. */
		/* tbl_user 테이블에 USERID, PWD 컬럼값과 비교해서 */
		/* 동일한 데이터 있으면 로그인성공 출력 */
		/* X둘중 하나라도 다르면 로그인실패 출력X */
		/* 2. */
		/* 아이디 없는 경우 : 해당아이디는존재하지않습니다 */
		/* 아이디는 있는데 비밀번호 다른 경우 : 비밀번호를 확인해주세요 */
		
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
	
		/* String sql = "SELECT * FROM TBL_USER WHERE USERID = '" 
					+ userId + "'" + " AND PWD = '" + pwd + "'"; */
		
		/* out.println(sql); */
		/* SELECT * FROM TBL_USER WHERE USERID = '' AND PWD = ''; */
		
		
		String sql = "SELECT * FROM TBL_USER WHERE USERID = '" + userId + "'";
		ResultSet rs = stmt.executeQuery(sql);
		
		/* true false */
		if(rs.next()){
			/* 아이디는 있는 경우 */
			if(pwd.equals(rs.getString("PWD"))){
				out.println("로그인성공!");	
			} else {
				/* 비밀번호 다를때 */
				out.println("비번확인하셈");
			}

		} else {
			out.println("해당아이디는존재하지않음");
		}
		
	%>
</body>
</html>