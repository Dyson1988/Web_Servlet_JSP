<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	int select = Integer.parseInt(request.getParameter("coffee"));
	int value = Integer.parseInt(request.getParameter("su"));
	int money = Integer.parseInt(request.getParameter("money"));
	
	String coffnum = request.getParameter("coffee");
	
	String selectCoffeName = "";
	int coffeMoney = 0;
	
	switch(select){
		case(1):
			selectCoffeName = "아메리카노";
			coffeMoney = 3000;
		break;
		case(2):
			selectCoffeName = "카페모카";
			coffeMoney = 3500;
		break;
		case(3):
			selectCoffeName = "에스프레소";
			coffeMoney = 2500;
		break;
		case(4):
			selectCoffeName = "카페라떼";
			coffeMoney = 4000;
		break;
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문결과</title>
</head>
<body>
	<fieldset>
	<legend>주문 계산 결과</legend>
	<form>
	<%--
	커피종류 : 아메리카노
	단가 : 3000원
	수량 : 3
	총금액 : 9000원
	---------------
	입금액 : 10000원
	잔돈    : 1000원
	 --%>
	 <ul>
	 	<li>커피종류 : <%=selectCoffeName %></li>
	 	<li>단가: <%=coffeMoney %></li>
	 	<li>수량 : <%=value %></li>
	 	<li>총금액 : <%=coffeMoney * value%></li>
	 	<li>입금액하신금액 : <%=money%></li>
	 	<li>잔돈 : <%=money - (coffeMoney*value)%></li>
	 </ul>
	 </form>
	 </fieldset>
</body>
</html>