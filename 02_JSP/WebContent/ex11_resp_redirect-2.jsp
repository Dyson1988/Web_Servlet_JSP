<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");
%>
	<h2>[ ex11_resp_redirect-2.jsp 페이지]</h2>
	<hr>
	<h2>아이디(ID) : <%=id %></h2>
	<h2>암호(pw) : <%=pw %></h2>
</body>
</html>