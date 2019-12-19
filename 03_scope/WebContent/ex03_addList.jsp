<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 품목을 장바구니에 담기 --%>
<% 
	//한글처리를 위한 문자처리방식 지정(특히 POST방식에서는 필수)
	request.setCharacterEncoding("UTF-8");

	//1. 전달받은 데이터 확인 
	String userSelect = (String)request.getParameter("product");
	
	//2. 장바구니에 담기 : ArrayList에 저장
	//ArrayList<String> list = new ArrayList<>();
	//list.add(product);
	//위 와 같이 ArrayList 객체에 만들어 버리면 ex03_addList.jsp에서 밖에 사용하지 못하기 때문에
	//ArrayList를 session scope에 저장하여 관리한다 
	
	ArrayList<String> list = (ArrayList<String>)session.getAttribute("product_list");
	if (list == null){//세션속성("product_list") 없는 경우
		session.setAttribute("product_list", new ArrayList<String>());
	
		//nullpointException이 발생할 수 있기 때문에 list 객체에 저장해 준다.
		list = (ArrayList<String>)session.getAttribute("product_list");
	}
	//위에서 nullpointException을 방지시켰기 때문에 아래 list.add를 해도 가능하다.
	list.add(userSelect);
	System.out.println("list : " + list);
%>
<script>
	//3. 쇼핑페이지로 되돌아 가기(페이지 전환 이동)
	alert("[<%=userSelect%> ] 추가되었습니다.");	
	history.go(-1); //뒤로 이동하기(이전페이지로 이동)
</script>