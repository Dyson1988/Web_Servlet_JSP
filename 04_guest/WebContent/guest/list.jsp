<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JDBC 프로그램으로 DB데이터 가져와서 화면 출력 --%>
<%
	//JDBC 프로그램을 위한 변수 선언
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "mystudy";
	String password = "qwer1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//GUEST 테이블에 있는 데이터를 가져오기 위한 Select문 작성
	String sql = "SELECT ROWNUM AS RN, SABUN, NAME, NALJA, PAY FROM GUEST ORDER BY SABUN";
	
	int cnt = 0; //전체 인원수
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
<style>
	body table {
		text-align: center;
	}
</style>
</head>
<body>
	<fieldset>
	<legend>[사원목록]</legend>
	<table border>
		<thead>
			<tr>
				<th>번호</th>
				<th>사번</th>
				<th>성명</th>
				<th>날짜</th>
				<th>금액</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
<%
	try {
		//1. 드라이버 로딩
		Class.forName(driver);
		//2. DB연결
		conn = DriverManager.getConnection(url, user, password);
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		//4. 쿼리실행
		rs = pstmt.executeQuery();
		//5. 쿼리실행 결과 처리
		while (rs.next()) {
%>			
			<tr>
				<td><%=rs.getInt("RN") %></td>
				<td><%=rs.getInt("SABUN") %></td>
				<td><%=rs.getString("NAME") %></td>
				<td><%=rs.getDate("NALJA") %></td>
				<td><%=rs.getInt("PAY") %></td>
				<td><a href="#">선택</a></td>
			</tr>
<%			
		}
		
		//GUEST 테이블에 등록 된 총 사원 수 조회
		rs = pstmt.executeQuery("SELECT COUNT(*) AS CNT FROM GUEST");
		if (rs.next()){
			cnt = rs.getInt("CNT");
		}
	} catch (Exception e) {
		//예외처리
		//conspan = 컬럼을 하나로 묶는 처리 6개를 1개로 처리
		out.print("<tr><td colspan='6'>");
		out.print("<h2>[예외발생] 담당자에게(8888) 연락바랍니다.");
		out.print("</td></tr>");
		//e.printStackTrace();
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
			
		</tbody>
	</table>
	</fieldset>
	<hr>
	<p style="color:blue">- 총 인원 : <%=cnt %>명 - </p>
	<input type="button" value="사원등록" onclick="location.href='addForm.jsp'">
</body>
</html>







