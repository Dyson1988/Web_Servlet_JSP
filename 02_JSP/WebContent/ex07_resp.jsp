<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//요청정보(request)로 부터 파라미터 값 추출
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	String[] hobbys = request.getParameterValues("hobby");
	if (hobbys == null) {
		hobbys = new String[] {"선택없음"};
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 데이터</title>
</head>
<body>
	<h1>회원가입 정보</h1>
	<ul>
		<li>이름 : <%=name %> </li>
		<li>아이디 : <%=id %> </li>
		<li>암호 : <%=pwd %> </li>
		<li>이메일 : <%=email %> </li>
		<li>취미 : 
		<%
		for (String hobby : hobbys){ %>
			<%=hobby + " " %>
		<%
		}%>
		</li>
		
		<hr>
		<h2>표현식 사용해서 취미 출력</h2>
		<p>취미 : 
		<%
		for (String hobby : hobbys){ %>
			<%=hobby + " " %>
		<%
		}%>
		</p>
	</ul>
</body>
</html>