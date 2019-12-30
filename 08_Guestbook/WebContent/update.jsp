<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	전달받은 VO객체를 사용해서 데이터 수정처리
	0. 전달받은 데이터 추출(session 객체에 있는)
	1. 조회된 데이터를 HTML 태그에 표시
	2. 수정완료 버튼이 눌러지면 암호확인 후 수정요청처리
		- 입력값과 VO에 있는 값 비교
	3. 암호 일치하면 DB 데이터 수정요청처리, 불일치면 권한없음 메시지 표시 
--%>
<%
	//0. 전달받은 데이터 추출(session 객체에 있는)
	//return타입이 object타입이기 때문에 GuestbookVO타입으로 형변환 시켜 준다.
	GuestbookVO gvo = (GuestbookVO)session.getAttribute("guestbookVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
<link href="css/guestbook.css" rel="stylesheet" type="text/css">
<script>
	function save_go(frm) {
		var pwd1 = frm.pwd.value;
		var pwd2 = "<%=gvo.getPwd() %>";
		
		if (pwd1 != pwd2){
			alert("입력하신 암호는 기존에 등록된 암호화 일치하지 않습니다.");
			frm.pwd.value = "";
			frm.pwd.focus();
			return false;
		}
		//수정 처리작업 페이지로 이동(DB작업)
		frm.action = "update.ok.jsp";
		frm.submit();
	}
</script>
</head>
<body>
<div id="container">
	<h2>방명록 : 수정화면</h2>
	<hr>
	<p><a href="list.jsp">[목록으로 이동]</a></p>
	<%-- <form action="write_ok.jsp" method="post"> --%>
	<form method="post">
		<table>
			<tbody>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="name" value="<%=gvo.getName() %>"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" value="<%=gvo.getSubject() %>"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" value="<%=gvo.getEmail() %>"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="pwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="content" rows="5" cols="60"><%=gvo.getContent() %></textarea>
						
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="수정완료" onclick="save_go(this.form)">
						<input type="reset" value="다시작성">
						<input type="hidden" name="idx" value="<%=gvo.getIdx() %>">
					</td>
				</tr>
			</tfoot>
		
		</table>
		
	
	</form>
</div>
</body>
</html>