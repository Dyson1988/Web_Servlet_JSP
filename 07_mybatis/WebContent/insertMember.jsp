<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.study.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 전달받은 데이터를 DB에 저장 
	1. 파라미터 값을 MemberVO 타입의 객체(memberVO)에 저장
	2. mapper 파일에 있는 insertMember id에 있는 SQL문 사용
	   memberVO 객체를 파라미터 값으로 전달
	3. 페이지 이동 : selectAll.jsp
--%>	
	<jsp:useBean id="memberVO" class="com.study.mybatis.MemberVO"/>
	<jsp:setProperty property="*" name="memberVO"/>
<%
	System.out.println("memberVO : " + memberVO);

	//SqlSession 객체 생성
	//.openSession(true) : 자동커밋 상태
	//.openSession(), .openSession(false) : 자동커밋 아님
	
	//오토커밋 아님 : 명시적 commit 처리 필요
	SqlSession ss = DBService.getFactory().openSession();
	
	int result = 0;
	
	//오토커밋 아닌 상태에서 명시적 commit, rollback 처리
	try {
		result = ss.insert("insertMember", memberVO);
		ss.commit(); //명시적 커밋 처리
	} catch (Exception e) {
		ss.rollback(); //명시적 롤백 처리
		result = -1;
	} finally {
		ss.close(); //사용자원 반납
	}
	System.out.println("result : " + result);
	
	System.out.println(">> insert 처리하고 close 됨");
	response.sendRedirect("selectAll.jsp");
	
%>
















