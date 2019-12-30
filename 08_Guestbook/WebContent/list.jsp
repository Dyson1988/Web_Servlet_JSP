<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB에 있는 데이터 전체 가져와서 화면에 표시
	//1. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession();

	//2. 매퍼의 SQL문 실행
	List<GuestbookVO> list = ss.selectList("all");
	ss.close();

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
<link href="css/guestbook.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="container">
	<h2>방명록</h2>
	<hr>
	<p><a href="write.jsp">[방명록 쓰기]</a></p>
	
	<table border>
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
		<%--
			<tr>
				<td>1</td>
				<td>홍일동</td>
				<td>
					<a href="oneList.jsp?idx=1">제목1</a>
				</td>
				<td>내용1</td>
			</tr>
		--%>
<% 
		//3. SQL문 실행 후 받은 결과 처리
		if(list.size() > 0){
			for(GuestbookVO vo : list){ 
%>				
			<tr>
				<td class="center"><%=vo.getIdx() %></td>
				<td><%=vo.getName() %></td>
				<td>
					<a href="oneList.jsp?idx=<%=vo.getIdx() %>"><%=vo.getSubject() %></a>
				</td>
				<td><%=vo.getRegdate() %></td>
			</tr>	
				
<%
			}
		} else {
			out.print("<tr><td colspan='4'>조회된 데이터 없음</td></tr>");
		}
	
%>
		</tbody>
	</table>

</div>
</body>
</html>