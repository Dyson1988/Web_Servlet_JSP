
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 파라미터 값 추출해서 화면표시 --%>
<%
	//form태그에서 post방식으로 들어오기때문에 한글처리 한다.
	request.setCharacterEncoding("UTF-8");
	//파라미터 값 추출
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");
	String[] hobby1 = request.getParameterValues("hobby");
%>
	<%-- 빈(Bean) 객체  infoVO 타입의 객체생성하고, personData변수에 저장 --%>
	<jsp:useBean id="personData" class="com.mystudy.infoVO" scope="request"/>
	<jsp:setProperty property="*" name="personData"/>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식</title>
</head>
<body>
	<h2>결과보기(표현식으로 form 데이터 표시)</h2>
	<ul>
		<li>이름 : <%=name %></li>
		<li>나이 : <%=age %></li>
		<li>성별 : <%=gender %></li>
		<li>취미 : <%=hobby %></li>
		<li>취미(반복문) : 
<%
		for (int i = 0; i < hobby1.length; i++){ %>
			<%=hobby1[i] %> 		
<%			
		}
%>		
		</li>
	</ul>
	<hr><hr>
	
	<h2>useBean형식으로 (데이터 표시)</h2>
	<h3>표현식으로 표현</h3>
	<ul>
		<li>이름 : <%=personData.getName() %></li>
		<li>나이 : <%=personData.getAge() %></li>
		<li>성별 : <%=personData.getGender() %></li>
		<li>취미 : <%=personData.getHobby() %></li>
		<li>취미(반복문) : 
<%
		for (String str : personData.getHobby()) { 
			out.print(str + " ");
		}
%>	
		</li>
	</ul>
	<h3>EL 사용 표현</h3>
	<ol>
		<li>이름 : ${personData.getName() }</li>
		<li>나이 : ${personData.getAge() }</li>
		<li>성별 : ${personData.getGender() }</li>
		<li>취미 : ${personData.getHobby() }</li>
		<li>취미(반복문) : 
			${personData.hobby[0] }
			${personData.hobby[1] }
			${personData.hobby[2] }
			${personData.hobby[3] }
	</ol>
</body>
</html>