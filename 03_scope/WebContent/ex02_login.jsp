<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	String loginChk = (String)session.getAttribute("loginChk");
	System.out.println("1. loginChk 데이터 : " + loginChk);
	if (loginChk != null){
		if(loginChk.equals("로그인 성공!!")){
			String id = (String)session.getAttribute("id");
			out.print("<h2>"+ id + "님 환영합니다^^" + "</h2>");
		} else {
			System.out.println("ID와 PW가 일치하지 않습니다 다시 시도해 주세요.");
			session.invalidate();
			response.sendRedirect("ex02_loginFailMessage.jsp");
		}
	} else {
		System.out.println("3. else문 안 loginChk 데이터 : " + loginChk);
	
%>	
	<form action="ex02_loginProc.jsp">
		<p>아이디 : <input type="text" name="id"></p>
		<p>암호 : <input type="password" name="pwd"></p>
		<input type="submit" value="로그인">
	</form>
<%
	}
%>
</body>
</html>