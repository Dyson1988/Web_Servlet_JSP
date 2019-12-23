<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//사용자가 입력한 정보 request.getParameter를 이용하여 변수에 저장 처리한다.
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String addr = request.getParameter("addr");
	
	//JDBC 프로그램을 위한 변수 선언
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "mystudy";
	String password = "qwer1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	//GUEST 테이블에 있는 데이터를 가져오기 위한 Select문 작성
	String insertSql = "INSERT INTO MEMBER2 VALUES (MEMBER2_SEQ.NEXTVAL, '" + id +   "', '" + pwd + "', '" 
																	        + name + "', "  + age + ", '"
																	        + addr + "', "  + "SYSDATE)";
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
			out.print("<script>alert('입력하신 회원정보가 정상적으로 입력 되었습니다\n확인 버튼을 누르시면 초기화면으로 돌아갑니다.');</script>");
			response.sendRedirect("start.jsp");
		} else {
			//insert 실패시 예외 처리는 아래 HTML body에 처리
			out.print("<script>alert('ID가 중복또는 입력을 실패하였습니다.\n 확인을 누르시면 다시 입력창으로 돌아갑니다.');</script>");
		}
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
%>