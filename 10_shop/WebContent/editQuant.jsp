<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. 파라미터 값 추출
	String p_num = request.getParameter("p_num");
	int su = Integer.parseInt(request.getParameter("su"));
%>

	<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/>
	
<%
	//2. 카트(cart)에서 제품 수량 변경
	cart.setQuant(p_num, su);

	//3. 페이지 이동(cartList.jsp)
	response.sendRedirect("cartList.jsp");

%>
	
	
