<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- DB에서 학번(idx) 데이터를 가져다 option 태그 만들기 --%>
<%
	//JDBC 프로그램을 위한 변수 선언
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "mystudy";
	String password = "qwer1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		//1. 드라이버 로딩
		Class.forName(driver);
		//2. DB연결
		conn = DriverManager.getConnection(url, user, password);
		
		//사용할 쿼리 작성
		String sql = "SELECT IDX FROM STUDENT2 ORDER BY IDX";
		
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		//4. 쿼리실행
		rs = pstmt.executeQuery();
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력대상선정</title>
<style>
	table { border-collapse: collapse; width: 800px; }
	th, td { border: 1px solid black; }
	
	h1,h2 { text-align: center; }
	table table { width: 60%; margin: auto;}
</style>
</head>
<body>

<table>
	<tr>
		<th width="250">
			<a href="main.jsp">
			<img src="../imgs/bitcamp_logo.png" alt="로고">
			</a>
		</th>
		<th width="100px"><a href="stuList.jsp">조회</a></th>
		<th width="100px"><a href="stuForm.jsp">학생등록</a></th>
		<th width="100px" bgcolor="orange"><a href="stuAdd.jsp">성적입력</a></th>
		<th width="100px"><a href="stuDel.jsp">데이터삭제</a></th>
	</tr>
	<tr>
		<td colspan="5" height="400">
		<center>
			<h1>성적입력 대상자 선택</h>
			<form action="stuUpdateForm.jsp">
				<select name="idx">
				<!--  
					<option value="1111">1111</option>
					<option value="2222">2222</option>
				-->
<%
				while (rs.next()) {
					int idx = rs.getInt("IDX");	
%>	
					<option value="<%=idx%>"><%=idx %></option>
<% 				}
%>			
				</select>
				
				<input type="submit" value="입력">
			</form>
		</center>
		</td>
	</tr>
</table>


<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>

<%			
	} catch (Exception e) {
		//예외처리
		e.printStackTrace();
	} finally {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
