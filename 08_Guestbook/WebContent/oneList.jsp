<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//전달받은 idx값 추출
	String idx = request.getParameter("idx");

	//데이터베이스에 연결 및 데이터 가져오기
	//1. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession();
	GuestbookVO gvo = ss.selectOne("selectOne", idx);
	ss.close();
	System.out.println("gvo : " + gvo);
	
	
	//2. SqlSession 객체 사용해서 SQL문장
	
	//3. 조회된 데이터 사용 - HTML 문장 데이터 표시
	//DB에 있는 데이터 전체 가져와서 화면에 표시
	//(조회데이터 계속사용) vo 객체를 계속사용하기 위해서 session에 등록
	//수정, 삭제 작업시 조회데이터 사용하기 위해 session에 등록
	session.setAttribute("guestbookVO", gvo);

	//세션에 있는 데이터 확인
	System.out.println("session guestbookVO : " + session.getAttribute("guestbookVO"));


	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<title>상세화면</title>
<link href="css/guestbook.css" rel="stylesheet" type="text/css">
<script>
	function update_go(frm) {
		frm.action = "update.jsp";
		frm.submit();
	}
	function delete_go(frm) {
		frm.action = "delete.jsp";
		frm.submit();
	}
</script>
</head>
<body>
<div id="container">
	<h2>방명록 : 상세화면</h2>
	<hr>
	<p><a href="list.jsp">[목록으로 이동]</a></p>
	<%-- <form action="write_ok.jsp" method="post"> --%>
	<form >
		<table>
			<tbody>
				<tr>
					<th>작성자</th>
					<td><%=gvo.getName() %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><%=gvo.getSubject() %></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><%=gvo.getEmail() %></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td></td>
				</tr>
				<tr>
					<td colspan="2"><%=gvo.getContent() %></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="update_go(this.form)">
						<input type="button" value="삭제" onclick="delete_go(this.form)">
					</td>
				</tr>
			</tfoot>
		
		</table>
		
	
	</form>
</div>
</body>
</html>