<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션 초기화 --%>
<% 
	//세션 초기화
	session.invalidate();

	//ex01_session.jsp 재요청 처리
	response.sendRedirect("ex01_session.jsp");
%>