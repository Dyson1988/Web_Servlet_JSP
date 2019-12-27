<%@page import="com.study.mybatis.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.study.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전체 데이터 정보 보여주기 --%>
<%
	/*
	openSession(true) : 자동커밋상태로 세션객체 생성
	openSession(), openSession(false) : Auto Commit 해제 선택(별도 트랜잭션처리 필요)
		- insert, update, delete 작업 후 반드시 commit, rollback 할 것
	//mapper에 정의되어 있는 id명을 찾아 해당 SQL문 실행하고 결과 리턴
	SqlSession.selectList(mapper의 id명) : select 결과가 여러개인 경우
		(0, 1, n개 데이타가 리턴되는 경우)
	SqlSession.selectOne(mapper의 id명) : select 결과가 하나인 경우(0,1개)
	*/
	
	//SqlSession 객체를 얻기(auto commit 상태 아님)
	SqlSession ss = DBService.getFactory().openSession();
	
	String id = request.getParameter("id");
	
	MemberVO vo =  ss.selectOne("selectOne", id);
	System.out.println("vo : " + vo);
	ss.close();
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 데이터 검색</title>
<script type="text/javascript" src="includee/event.js"></script>
</head>
<body>
	<%-- 테이블형태로 만든 메뉴 및 입력폼 삽입 --%>
	<%@ include file="includee/menu.jspf" %>
	
	<h1>ID검색 데이터 조회</h1>
<%
	if (vo != null) {
%>
	<ul>
		<li>
		<%=vo.getIdx() %> ::
		<%=vo.getId() %> ::
		<%=vo.getPwd() %> ::
		<%=vo.getName() %> ::
		</li>
	</ul>
<%
	} else {
		out.println("<h2>데이터 없음</h2>");
	}
%>
</body>
</html>















