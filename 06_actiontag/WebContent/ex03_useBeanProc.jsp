<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터값 처리</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
	<h2>일반적인 파라미터 처리 방법</h2>
	이름 : <%=name %><br>
	나이 : <%=age %><br>
	<hr>
	
	<h2>속성(attribute)을 이용(request)</h2>
<%
	request.setAttribute("attr_name", name + "attr");
	request.setAttribute("attr_age", age + "attr");
%>
	이름 : <%=request.getAttribute("attr_name") %>
	나이 : <%=request.getAttribute("attr_age") %>
	
	<%--=========================================== 
	액션태그 : <jsp:useBean></jsp:useBean>
	자바빈(Bean)을 이용해서 파라미터 값을 표현
	자바빈(Bean)은 데이터를 저장할 목적으로 JSP에서 제공하는 저장소
	<useBean 액션태그의 역할 및 사용법>
	1. VO 객체 생성(자바 클래스)
	2. 자바빈 생성 (useBean 액션태그 사용)
		id : 사용할 변수명 
		class : 실제 클래스의 위치(패키지 + 클래스명)
		scope : default page, request, session, application
	
	--%>
	<jsp:useBean id="person" class="com.mystudy.InfoVO" scope="request"/>
	<%-- 
	com.mystudy.InfoVo person = new com.mystudy.InfoVO(); 이런식으로 자동으로 객체를 만들어 줌
	--%>
	<%-- 
	<jsp:setProperty property="name" name="person"/>
	<jsp:setProperty property="age" name="person"/>
	--%>
	<jsp:setProperty property="*" name="person"/>
<%
	System.out.println("person : " + person);
%>
	<%-- 표현식은 null을 거를수 없다 null값이면 기냥 null값 찍어버림 --%>
	<h2>자바빈 객체의 getter 이용해서 값 표시(표현식)</h2>
	<h2>이름 : <%=person.getName() %></h2>
	<h2>나이 : <%=person.getAge() %></h2>
	<hr>
	
	<h2>자바빈 객체의 getter 이용해서 값 표시(액션태그 getProperty)</h2>
	<h2>이름 : <jsp:getProperty property="name" name="person"/></h2>
	<h2>이름 : <jsp:getProperty property="age" name="person"/></h2>
	<hr>
	
	<h2>자바빈 객체의 getter 이용해서 값 표시(EL)</h2>
	<h2>이름(EL) : ${person.name }</h2>
	<h2>나이(EL) : ${person.age }</h2>
	<hr>
	<h2>이름(EL get) : ${person.getName() }</h2>
	<h2>나이(EL get) : ${person.getAge() }</h2>
</body>
</html>