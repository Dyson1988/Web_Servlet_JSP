<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 학번(idx),국어,영어,수학 값을 DB에 수정처리 --%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	
	//JDBC 프로그램을 위한 변수 선언
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "qwer1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	//전달받은 파라미터 값 추출
	int idx = Integer.parseInt(request.getParameter("idx"));
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	
	int result = 0;
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		
		//SQL 준비
		String sql = "";
		sql += "UPDATE STUDENT2 ";
		sql += "   SET KOR = ? ";
		sql += "     , ENG = ? ";
		sql += "     , MATH = ? ";
		sql += " WHERE ID = ? ";
		
		//3-1. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		
		//3-2. 바인드변수에 데이터 셋팅하기
		pstmt.setInt(1, kor);
		pstmt.setInt(2, eng);
		pstmt.setInt(3, math);
		pstmt.setInt(4, idx);
		
		//4. 쿼리실행
		result = pstmt.executeUpdate();
		
		//작업결과 확인 후 처리
		response.sendRedirect("stuList.jsp");
		
	} catch (Exception e) {
		e.printStackTrace();

		//<h2>[예외발생]수정작업 실패!!!</h2>
		//<h2>담당자(8282)에게 연락하세요</h2>
		
	} finally {
		try {
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
<title>예외발생</title>
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
		<th width="100px"><a href="stuAdd.jsp">성적입력</a></th>
		<th width="100px"><a href="stuDel.jsp">데이터삭제</a></th>
	</tr>
	<tr>
		<td colspan="5" height="400">
		<center>
			<h2>[예외발생]수정작업 실패!!!</h2>
			<h2>담당자(8282)에게 연락하세요</h2>
		</center>
		</td>
	</tr>
</table>


<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>











