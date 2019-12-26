<%@page import="com.mystudy.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 전달받은 파라미터 값 VO저장 
	1. MemberVO 타입의 객체(memberVO) 생성
	2. 전달받은 파라미터 값을 memberVO 객체(인스턴스)에 저장
	3. memberVO의 값 가져와서 화면출력
--%>
<%-- 
<%
	MemberVO memberVO = new MemberVO();
	memberVO.setName(request.getParameter("name"));
	memberVO.setAge(request.getParameter("age"));
%>
--%>

 	<jsp:useBean id="memberVO" class="com.mystudy.MemberVO"/>
	<jsp:setProperty property="*" name="memberVO"/>
	<jsp:setProperty property="pwd" name="memberVO" param="password"/>
<%
	System.out.println(memberVO);
%>	
	
	<h1>자바빈(Bean, VO)을 이용한 파라미터 출력</h1>
	<ul>
		<li>이름 : <%=memberVO.getName() %></li>
		<li>나이 : <%=memberVO.getAge() %></li>
		<li>암호 : <%=memberVO.getPwd() %></li>
		<li>성별 : <%=memberVO.getGender() %></li>
		<li>취미 : <%=memberVO.getHobby() %></li>
		<li>취미(배열값 처리) :
		<%
			for (String str : memberVO.getHobby()) {
				out.print(str + " ");
			}
		%>
		</li>
	</ul>
	











