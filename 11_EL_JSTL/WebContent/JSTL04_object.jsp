<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL VO</title>
</head>
<body>
	<h1>JSTL Bean(VO객체) 다루기</h1>
	<h2>객체에 값 설정(VO 객체)</h2>
	<jsp:useBean id="person" class="com.mystudy.infoVO" />
	<c:set target="${person }" property="name" value="코돌쓰"/>
	<c:set target="${person }" property="age" value="2"/>
	
	<p>person : <c:out value="${person }"/> </p>
	<p>person : ${person }</p>
	<hr>
	
	<p>person.name : 
		<c:out value="${person.name }" default="이름등록안됨"/> 
	</p>
	<%--EL태그는 값이 없으면 null로 표기되지 않고 공백(space)로 처리 된다. --%>
	<p>person.getName() : ${person.getName() }</p>
	
	<p>person.gender : 
		<c:out value="${person.gender }" default="${person.name }는 성별이없는녀석입니다."/> 
	</p>
	
</body>
</html>