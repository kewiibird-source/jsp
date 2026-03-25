<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>area</title>
</head>
<body>
<form action="area.jsp" name="form">
	<%@ include file="../db.jsp" %>
	시/도 : <select name="paramSi" onchange="fnselectsi()">
			<!-- name을 지정해줘야 area.jsp?si=인천광역시 파라미터로 넘어감 -->
			<option value="">:: 선택 ::</option>
	<%
		String paramSi = request.getParameter("paramSi");
		/* 파라미터(주소창)에 있는 paramsi 꺼내오기 */
		String sql = "SELECT DISTINCT SI FROM AREA";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			String si = rs.getString("SI");
			String selected = si.equals(paramSi) ? "selected" : "";
	%>
			<option value="<%= si %>"<%= selected %>><%= si %></option>
	<% 		
		}
	%>
		</select>
	
	구 : <select name="paramGu" onchange="fnselectsi()">
			<option value="">:: 선택 ::</option>
	<%
		String paramGu = request.getParameter("paramGu");
		paramGu = paramGu != null ? paramGu : "";
		
		sql = "SELECT DISTINCT GU FROM AREA WHERE GU IS NOT NULL ";
		sql += "AND SI = '" + paramSi + "'";
		/* paramSi 선택 안하면 paramGu는 조회가 아예 안됨 */
		/* 선택했을때 비로소 paramSi에 값이 들어가서 Gu가 조회됨! */
		
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			String gu = rs.getString("GU");
			String selected = gu.equals(paramGu) ? "selected" : "";
	%>
			<option value="<%= gu %>"<%= selected %>><%= gu %></option>
	<% 		
		}
	%>
		</select>
	
	동 : <select name="paramDong" onchange="fnselectsi()">
			<option value="">:: 선택 ::</option>
	<%
		String paramDong = request.getParameter("paramDong");
		paramDong = paramDong != null ? paramDong : "";
		
		sql = "SELECT DISTINCT DONG FROM AREA WHERE DONG IS NOT NULL ";
		sql += "AND SI = '" + paramSi + "' AND GU = '" + paramGu + "'";
		
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			String dong = rs.getString("DONG");
			String selected = dong.equals(paramDong) ? "selected" : "";
	%>
			<option value="<%= dong %>"<%= selected %>><%= dong %></option>
	<% 		
		}
	%>
		</select>
		
</form>
</body>
</html>
<script>
	function fnselectsi(){
		document.form.submit();
		
	}
</script>