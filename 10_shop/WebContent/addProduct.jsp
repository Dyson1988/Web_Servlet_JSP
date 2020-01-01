<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 

      #####################################
      ######   장바구니에 담기 처리하는 jsp   ######
      #####################################
      
      
	장바구니(cart)에 담고, 제품상세페이지로 이동
	1. 장바구니 정보를 다룰 객체 생성(카트 만들기)
	2. 장바구니에 제품 추가(전달받은 제품번호 사용)
	3. 장바구니에 담은 후 다시 상세페이지로 이동처리
		(제품번호의 상세정보 표시 : 제품번호 전달)
--%>
	<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/>
	<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO" scope="session"/>
<%
	//전달받은 파라미터 값 추출
	String p_num = request.getParameter("p_num");

	//장바구니(cart)에 제품 담기
	cart.addProduct(p_num, dao);
	System.out.println(">> 카트목록 : " + cart.getList());
	System.out.println(">> 카트금액 : " + cart.getTotal());
	
	//제품 상세페이지로 이동
	response.sendRedirect("product_content.jsp?p_num=" + p_num);
%>