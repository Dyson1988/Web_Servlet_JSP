<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- [로그아웃] 세션초기화 후 로그인 화면으로 이동 --%>
<% 
	//세션초기화
	session.invalidate();

	//로그인 페이지로 이동
	response.sendRedirect("ex03_login.jsp");
%>