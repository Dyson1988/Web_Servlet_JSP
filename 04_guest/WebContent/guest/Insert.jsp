<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 사용해서 DB에 사용처리
	정상입력 : list.jsp 페이지로 이동
	예외발생 : 현재 페이지 보여주기
 --%>
 
<%!
	//JDBC 프로그램을 위한 변수 선언
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "mystudy";
	String password = "qwer1234";
%> 
<%
	String name = request.getParameter("name");
	String pay = request.getParameter("pay");
	String sabun = request.getParameter("sabun");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//사용할 쿼리 작성
	String insertSql = "INSERT INTO GUEST VALUES (" + sabun + ", '" + name + "',"  + "SYSDATE," +  pay + ")"; 
						
	int insertCount = 0;
	try {
		//1. 드라이버 로딩
		Class.forName(driver);
		//2. DB연결
		conn = DriverManager.getConnection(url, user, password);
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(insertSql);
		//4. 쿼리실행
		insertCount = pstmt.executeUpdate();
		
		//5. 쿼리실행 결과 처리
		if (insertCount > 0){
			response.sendRedirect("list.jsp");
		} else {
			//insert 실패시 예외 처리는 아래 HTML body에 처리
		}
	} catch (Exception e) {
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 등록 실패</title>
</head>
<body>
	<fieldset>
	<legend>사원 등록 실패</legend>
	<p>입력작업 처리를 하지 못했습니다.<br>
	[입력페이지로 이동] 클릭해서 다시 작업하세요.</p>
	<a href="addForm.jsp">입력 페이지 이동</a>
	</fieldset>
</body>
</html>