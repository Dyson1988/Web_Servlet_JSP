<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	//(실습) 전달받은 파라미터 값을 사용해서 HTML 태그 만들기
	//스크립트릿, out, 표현식 사용해서 값 처리
	<%
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	%>
</script>
<title>성적처리 결과</title>
</head>
<body>
	<h1>(실습)성적처리 결과</h1>
	<h2>p태그로 출력</h2>
	<p>이름 : <%=name %> </p>
	<p>국어 : <%=kor %> </p>
	<p>영어 : <%=eng %> </p>
	<p>수학 : <%=math %> </p>
	<p>총점 : <%= (kor+eng+math) %></p>
	<p>평균 : <%= (kor+eng+math)/3 %></p>
	
	<hr>
	<h2>테이블로 출력</h2>
	
	<%!
	public void form(String str, String name, JspWriter out, int select)throws IOException  { 
		if (select > 0 && select < 3) {
			if (select == 1) {
				out.write("<p>" + str +": " + name +"</p>");
			} else {
				out.write("<tr><th>" + str + "</th>");
				out.write("<td>"+ name +"</td></tr>");
			}
		}
	};
	public void form(String str, int score, JspWriter out, int select)throws IOException  { 
		if (select > 0 && select < 3) {
			if (select == 1) {
				out.write("<p>" + str +": " + score +"</p>");
			} else {
				out.write("<tr><th>" + str + "</th>");
				out.write("<td>"+ score +"</td></tr>");
			}
		}
	};
	
	public void sumAvg(int a, int b, int c, JspWriter out, int select)throws IOException {
		if (select > 0 && select < 3) {
			if (select == 1) {
				out.write("<p>총점 : " + (a+b+c) +"</p>");
				out.write("<p>평균 : " + ((a+b+c) / 3) +"</p>");
			} else {
				out.write("<tr><th>총점</th>");
				out.write("<td>"+ (a+b+c) +"</td></tr>");
				out.write("<tr><th>평균</th>");
				out.write("<td>"+ ((a+b+c) / 3) +"</td></tr>");
			}
		}
	};
	
	%>
	
	<%
	out.write("<table border>");
	form("이름", name, out, 2);
	form("국어", kor, out, 2);
	form("영어", eng, out, 2);
	form("수학", math, out, 2);
	sumAvg(kor, eng, math, out, 2);
	out.write("</table>");
	 %>
</body>
</html>