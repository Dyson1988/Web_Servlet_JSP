<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류처리페이지</title>
<script>
	function go(){
		alert("[예외발생] 이전페이지로 이동합니다.");
		history.back(); // 이전페이지로 이동(history.go(-1)) 동일
	}
</script>
</head>
<body onload="go()">

</body>
</html>