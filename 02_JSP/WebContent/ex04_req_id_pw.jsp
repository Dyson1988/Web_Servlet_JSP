<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP id, pw</title>
<script>
	function send_go(frm){
		alert("전달받은 객체: " + frm);
		frm.action = "ex04_resp.jsp";
		frm.submit();
	}
</script>
</head>
<body>
	<%-- JSP 요청 페이지에서 응답페이지로 이동 --%>
	<fieldset>
	<legend>(요청)ID, PW 값 서버측에 전달</legend>
	<%-- <form action="ex04_resp.jsp"> --%>
	<form>
		<p>ID : <input type="text" name="id"></p>
		<p>PW : <input type="text" name="pw"></p>
		
		<input type="submit" value="전송(다른페이지로 이동)" onclick="send_go(this.form)">
	</form>
	</fieldset>
</body>
</html>