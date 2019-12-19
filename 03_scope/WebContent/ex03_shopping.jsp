<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//한글처리를 위한 문자처리방식 지정(특히 POST방식에서는 필수)
	request.setCharacterEncoding("UTF-8");
	
	//전달받은 파라미터 값 추출
	String name = request.getParameter("name");
	System.out.println("> name : " + name);
	
	//계속 로그인상태임을 처리하기 위하여 session scope에 저장 하여 값을 관리 한다.
	//페이지 전환시에도 계속 이름을 사용하기 위해 session에 저장
	session.setAttribute("clientName", name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물건구입</title>
<script>
	function add_list(frm) {
		frm.action = "ex03_addList.jsp";
		frm.submit();
	}
</script>
</head>
<body>
	<h2>상품선택</h2>
	
	<hr>
	[ <%=session.getAttribute("clientName") %> ] 님 로그인 상태입니다.
	<hr>
	
	<form method="POST">
		<select name="product">
			<option>::선택하세용</option>
			<option value="철학">철학</option>
			<option value="미술학">미술학</option>
			<option value="수학">수학</option>
			<option value="여행">여행</option>
			<option value="방학">방학</option>
		</select>
		<input type="button" value="추가" onclick="add_list(this.form)">
	</form>
	<p><a href="ex03_List_calc.jsp">계산하기</a></p>
	<p><a href="ex03_Logout.jsp">로그아웃</a></p>
	
</body>
</html>