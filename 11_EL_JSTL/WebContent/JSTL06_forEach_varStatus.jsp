<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach varStatus</title>
</head>
<body>
	<h2>forEach varStatus 속성</h2>
<%
	List<String> list = new ArrayList<String>();
	list.add("코돌쓰-1");
	list.add("코돌쓰-2");
	list.add("코돌쓰-3");
	list.add("코돌쓰-4");
	pageContext.setAttribute("arrayList", list);
%>
	<h2>forEach varStatus 속성</h2>
	<p>List 값 :
		<c:forEach items="${arrayList }" var="listItem">
			${listItem } &nbsp;&nbsp;
		</c:forEach>
	</p>
	<hr><hr>
	
	<c:forEach var="listItem" items="${arrayList }" varStatus="status"
			   begin="0" end="${arrayList.size() }" step="1">
	<p>
		var 값 : ${listItem }<br>
		status.current : ${status.current }<br> 
		status.index : ${status.index }<br><%-- 배열 index 번호 --%> 
		status.count : ${status.count }<br><%-- 처리되는 데이터 건수 --%>
		status.first : ${status.first }<br><%-- 첫번째 데이터인지 check --%>
		status.last : ${status.last }<br>  <%-- 마지막 데이터인지 check --%>
		
		status.begin : ${status.begin }<br>
		status.end : ${status.end }<br>
		status.step : ${status.step }<br>
	</p>
	<hr>
	</c:forEach>
</body>
</html>