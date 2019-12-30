<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//0. 한글처리(POST 방식으로 데이터 받았을 때)
	request.setCharacterEncoding("UTF-8");
	String pwd = request.getParameter("pwd");
	GuestbookVO gvo = (GuestbookVO)session.getAttribute("guestbookVO");	

	if (!pwd.equalsIgnoreCase(gvo.getPwd())){
%>
	<script>
		alert("[예외발생] 입력하신 암호와 저장되어 있는 암호가 서로 일치하지 않았습니다.\n"
			  + "다시 입력해 주세요.\n"
			  + "이전 페이지로 이동합니다.");
		location.href = "delete.jsp";
	</script>
<%	
	} else {
		System.out.println(gvo.getIdx());
		System.out.println(gvo);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			ss.delete("delete", gvo);
%>
		<script>
			//4-1. 정상처리시 분기처리
			alert("정상적으로 삭제 되었습니다.\n"
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
	}
%>