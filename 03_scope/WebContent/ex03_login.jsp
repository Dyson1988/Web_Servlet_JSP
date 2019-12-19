<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h2>로그인</h2>
	<%-- method에서 post를 하는수간 페이지 이동시 데이터가 보이지 않는다. --%>
	<form action="ex03_shopping.jsp" method="POST">
		이름 : <input type="text" name="name">
		<input type="submit" value="로그인">
	</form>
</body>
</html>