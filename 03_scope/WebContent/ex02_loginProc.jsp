<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 아이디, 암호 사용해서 로그인 처리 --%>

<%!
	String dbID = "MPerformance";
	String dbPW = "qwer1234";
%>

<%
	//1. 파라미터 값 추출
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//2. 전달받은 값(id, pwd) 사용 로그인 처리
	//3. 로그인 성공/실패 여부에 따라 session 값 설정
	//DB에 있는 데이터를 확인해서 처리해야 하지만, 간단히 처리
	if (dbID.equalsIgnoreCase(id) && dbPW.equalsIgnoreCase(pwd)) {
		session.setAttribute("loginChk", "로그인 성공!!");
		session.setAttribute("id", id);
	} else {
		session.setAttribute("loginChk", "로그인 실패.");
	}
	System.out.println("loginChk : " + session.getAttribute("loginChk"));
	
	//4. 페이지 전환(로그인 페이지로 이동)
	response.sendRedirect("ex02_login.jsp");
%>
