<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	(실습) 전달받은 데이터를 DB에 저장(수정)
	수정성공 : 목록페이지로 이동(list.jsp)
	수정실패 : 메시지 표시후 이전화면(수정페이지) 이동
--%>
<%
	//0. 한글처리(POST 방식으로 데이터 받았을 때)
	request.setCharacterEncoding("UTF-8");
	//(실습) 순서에 따라 입력(insert) 작업 처리
	//1. 파라미터 값 추출해서 VO객체에 저장
%>
	<jsp:useBean id="gvo" class="com.bc.mybatis.GuestbookVO"/>
	<jsp:setProperty property="*" name="gvo"/>
<% 
	System.out.println("guestbookVO : " + gvo);
	
	//2. sqlSession 객체 생성(DB연동작업용) - 자동커밋 형태로
	SqlSession ss = DBService.getFactory().openSession(true);
	int result = 0;
	
	//3. 매퍼(mapepr)의 SQL의 "insert" ID  사용해서 DB에 입력(insert)
	result = ss.update("update", gvo);
	ss.close();
	
	//4. 수정작업 후 분기 처리
	//4-1. 수정건수가 0 보다 크면 : 상세페이지로 이동(수정내용확인)
	//4-2. 수정건수가 1 보다 크면 :  
	if (result > 0){
		response.sendRedirect("oneList.jsp?idx=" + gvo.getIdx());
	}else {
%>
	<script>
		//4-2. 예외발생시 분기처리
		alert("[예외발생] 입력처리 되지 않았습니다.\n"
			  + "담당자(8282)에게 연락하세요.\n"
			  + "이전 페이지로 이동합니다.");
		history.back();
	</script>
<%			
	}
%>	