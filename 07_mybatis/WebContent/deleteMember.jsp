<%@page import="com.study.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.study.mybatis.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달된 id값으로 DB 데이터 삭제 후 전체조회 페이지 이동 --%>
<%-- SqlSession 객체 생성 : 자동커밋 상태로 생성
	 .delete("deleteMember", id) 처리 후
	 selectAll.jsp 페이지로 이동
--%>
<%
	//전달받은 파라미터 값 추출
	String id = request.getParameter("id");
	//MemberVO memberVO = new MemberVO();
	//memberVO.setId(id);
	
	SqlSession ss = DBService.getFactory().openSession(true);
	int result = ss.delete("deleteMember", id);
	//ss.commit();//자동커밋상태인 경우 .openSession(true) 생략해도 commit됨
	ss.close();
	
	System.out.println("> delete result : " + result);
	response.sendRedirect("selectAll.jsp");
	
%>















