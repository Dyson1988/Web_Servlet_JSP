<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 학번(idx), 성명(name)값을 DB에 입력처리 --%>
<%
	//JDBC 프로그램을 위한 변수 선언
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "qwer1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	//전달받은 파라미터 값 추출
	int idx = Integer.parseInt(request.getParameter("idx"));
	String name = request.getParameter("name");
	
	int result = 0;
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		
		//SQL 준비
		String sql = "";
		sql += "INSERT INTO STUDENT2 (IDX, NAME, KOR, ENG, MATH) ";
		sql += "VALUES (?, ?, 0, 0, 0)";
		
		//3-1. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		
		//3-2. 바인드변수에 데이터 셋팅하기
		pstmt.setInt(1, idx);
		pstmt.setString(2, name);
		
		//4. 쿼리실행
		result = pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//작업결과 확인 후 처리
	if (result > 0) {//데이터 입력된 경우
		response.sendRedirect("stuList.jsp");
	} else {
		response.sendRedirect("stuForm.jsp");
	}
	
%>











