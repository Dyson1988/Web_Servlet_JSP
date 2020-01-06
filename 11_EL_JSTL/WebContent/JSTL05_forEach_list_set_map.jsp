<%@page import="com.mystudy.infoVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
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
<title>JSTL forEach</title>
</head>
<body>
	<h1>JSTL forEach : List, Set, Map</h1>
	<h2>Array 출력</h2>
	<p>출력대상 : {"a", "ab", "abc", "abcd"}</p>
<%
	String[] strs = {"a", "ab", "abc", "abcd"};
	pageContext.setAttribute("arr", strs);
%>
	<c:forEach var="str" items="${arr }">
		<p>${str }</p>
	</c:forEach>
	<hr>
	
	<h3>배열(Array) 일부 데이터만 사용(2, 3번째: 1,2번 인덱스)</h3>
	<p>출력대상(2번째 3번째) : {"a", "ab", "abc", "abcd"}</p>
	<ul>
		<c:forEach var="str" items="${arr }" begin="1" end="2">
			<li>${str }</li>
		</c:forEach>
	</ul>
	<hr><hr>
	
	<%--================  List 출력   ====================--%>
	<h1>List 출력</h1>
<%
	List<Integer> list = new ArrayList<Integer>();
	list.add(123);
	list.add(45);
	list.add(678);
	list.add(90);
	pageContext.setAttribute("arrayList", list);
%>
	<ul>
		<c:forEach var="listData" items="${arrayList }">
			<li>${listData }</li>
		</c:forEach>
	</ul>
	<hr><hr>
	
	<h1>Set 출력</h1>
<%
	Set<String> set = new HashSet<>();
	set.add("코돌쓰");
	set.add("코숭쓰");
	set.add("해나쓰");
	set.add("떡카");
	pageContext.setAttribute("hashSet", set);
%>	
	<ul>
		<c:forEach var="setData" items="${hashSet }">
			<li>${setData }</li>
		</c:forEach>
	</ul>
	<hr><hr>
	
	<%-- ======== Map key-value 데이터 출력 ======== --%>
	<h1>Map 출력</h1>
<%
	Map<String, String> map = new HashMap<>();
	map.put("코끼리", "코돌쓰");
	map.put("원숭이", "코숭쓰");
	map.put("여자", "김해나");
	map.put("자동차", "떡카");
	pageContext.setAttribute("hashMap", map);
%>
	<c:forEach var="mapData" items="${hashMap }">
		<p>${mapData.key } - ${mapData.value }</p>
	</c:forEach>
	<hr><hr>
	
	<%-- ========================================= --%>
	<h1>VO가 담긴 List 값 사용</h1>
<%
	List<infoVO> listBean = new ArrayList<>();
	listBean.add(new infoVO("코돌쓰", "2"));
	listBean.add(new infoVO("코숭쓰", "1"));
	listBean.add(new infoVO("해나뜨", "34"));
	listBean.add(new infoVO("덕영뜨", "32"));
	
	pageContext.setAttribute("persons", listBean);
%>
	<c:forEach var="voData" items="${persons }">
		<p>이름 : ${voData.getName() } - ${voData.getAge() }살</p>
	</c:forEach>
</body>
</html>