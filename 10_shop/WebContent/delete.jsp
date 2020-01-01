<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. 파라미터 값 추출
	String p_num = request.getParameter("p_num");
%>

	<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/>
	
<%
	//2. 카트(cart)에서 제품 삭제
	cart.delProduct(p_num);

	//3. 페이지 이동(cartList.jsp)
	response.sendRedirect("cartList.jsp");

%>
	
	
