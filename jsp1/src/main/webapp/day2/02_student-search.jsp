<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>student-search</title>
</head>
<body>
	<!-- student-search.jsp -->
	<!-- 학번은 8글자 아니면 다음페이지로 안넘어감 -->
	<!-- student-search-result에서는 입력한 학번의 학생이 있을 경우 -->
	<!-- 해당 학생의 이름은 ㅇㅇㅇ 입니다 출력 -->
	<!-- 없으면 조회에 실패했습니다 출력 -->
	<form action="student-search-result.jsp" name="search">
		<div>
			학번 : <input type="txt" name="stuNo">
				<input type="button" value="검색" onclick="fnsearch()">
		</div>
	</form>
</body>
</html>
<script>
	function fnsearch(){
		let form = document.search;
		
		if(form.stuNo.value.length != 8){
			alert("학번은 8글자 입미다");
			return;
		}
		
		form.submit();
	
	}
</script>