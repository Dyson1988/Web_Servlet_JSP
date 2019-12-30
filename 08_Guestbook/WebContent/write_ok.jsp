<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	전달받은 데이터를 DB에 저장 (write_ok.jsp)
	입력성공시  	   : 목록페이지로 이동(list.jsp)
	입력실패(예외) : 메시지 표시 후 이전화면(입력페이지) 이동 
--%>
<%
	//0. 한글처리(POST 방식으로 데이터 받았을 때)
	request.setCharacterEncoding("UTF-8");
	//(실습) 순서에 따라 입력(insert) 작업 처리
	//1. 파라미터 값 추출해서 VO객체에 저장
%>
	<jsp:useBean id="guestbookVO" class="com.bc.mybatis.GuestbookVO"/>
	<jsp:setProperty property="*" name="guestbookVO"/>
<% 
	System.out.println("guestbookVO : " + guestbookVO);
	
	//2. sqlSession 객체 생성(DB연동작업용) - 자동커밋 형태로
	SqlSession ss = DBService.getFactory().openSession(true);
	
	//3. 매퍼(mapepr)의 SQL의 "insert" ID  사용해서 DB에 입력(insert)
	try {
		ss.insert("insertdata", guestbookVO);
%>
	<script>
		//4-1. 정상처리시 분기처리
		alert("정상 입력되었습니다.\n"
			+ "목록 페이지로 이동합니다.");
		location.href = "list.jsp";
	</script>
<%
	} catch (Exception e){
		e.printStackTrace();
%>
	<script>
		//4-2. 예외발생시 분기처리
		alert("[예외발생] 입력처리 되지 않았습니다.\n"
			  + "담당자(8282)에게 연락하세요.\n"
			  + "이전 페이지로 이동합니다.");
		history.back();
	</script>
<%			
	} finally {
		ss.close();
	}
	System.out.println(">> insert 처리하고 close 됨");
	response.sendRedirect("list.jsp");
%>