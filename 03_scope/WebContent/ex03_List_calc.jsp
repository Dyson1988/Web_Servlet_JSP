<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<h2>계산</h2>
	<p>[ <%=session.getAttribute("clientName") %> ] 님 계산할 목록 입니다.</p>
	<fieldset>
	<legend>계산할 품목</legend>
	<form>
	<%
		System.out.println(session.getAttribute("product_list"));
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("product_list");
		if (list != null){
			out.print("<ul>");
			for (int i = 0; i <list.size(); i++ ){
					out.print("<li>");
					out.print(list.get(i));
					out.print("</li>");
			}
			out.print("</ul>");
		} else {
			out.print("<p>계산할 품목이 없습니다.</p>");
		}
	%>
	<%-- ul, li 사용해서 장바구니 목록 출력 --%>
	</form>
	</fieldset>
	
	<p><a href="ex03_Logout.jsp"></a></p>
</body>
</html>