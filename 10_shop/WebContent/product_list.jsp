<%@page import="com.bc.mybatis.ShopDAO"%>
<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 제품분류목록 값에 해당하는 제품정보를 DB에서 조회화면에 목록형태(테이블)로 표시 --%>
<%
	//전달받은 파라미터 값 추출
	String category = request.getParameter("category");

	//DB 데이터 조회
/*
	//방법1 : DBService SqlSession 객체 이용해서 DB작업
	SqlSession ss = DBService.getFactory().openSession();
	List<ShopVO> list = ss.selectList("list", category);
	for (ShopVO vo : list){
		System.out.println("list : " + list);
	}
*/
	//ShopDAO dao = new ShopDAO();

	//jsp:useBean 동작방식
/*	
	ShopDAO dao = (ShopDAO)session.getAttribute("dao");
	if (dao == null){
		dao = new ShopDAO();
		session.setAttribute("dao", dao);
	}
*/
%>
	<%-- 방법2 : DAO 이용 --%>
	<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO" scope="session"></jsp:useBean>
	
<%
	List<ShopVO> list = dao.list(category);
	for (ShopVO vo : list){
		System.out.println(vo);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품목록</title>
<style>
	table {
		width: 600px;
		margin: 30px auto 0 auto; /* 상 우 하 좌 */
		border: 1px solid navy;
		border-collapse: collapse;
		font-size: 0.8em;
	}
	th, td { border: 1px solid navy; padding: 4px; }
	th { background-color: #dedede; }
	.red { color: red; }
</style>
</head>
<body>
	<jsp:include page="shop.jsp"></jsp:include>
	<table>
		<tr>
			<th width="15%">제품번호</th>
			<th width="10%">이미지</th>
			<th width="20%">제품명</th>
			<th width="20%">제품가격</th>
			<th>비고</th>
		</tr>
<%--
		<tr>
			<td>vC-13</td>
			<td>
				<img src="images/pds1.jpg" width="100px" height="95px">
			</td>
			<td>사니PDP-TV</td>
			<td>할인가<br>
				<span class="red">할인율</span>
			</td>
			<td>시중가격</td>
		</tr>
--%>
<%
	if (list.size() < 1) { //등록제품이 없는 경우
		out.print("<tr><td colspan='5'>");
		out.print("현재 등록된 데이터가 없습니다. ");
		out.print("</td></tr>");
	} else { //등록된 제품이 있는 경우
		for (ShopVO vo : list){ %>
		<tr>
			<td><%=vo.getP_num() %></td>
			<td>
				<img src="images/<%=vo.getP_image_s() %>" width="100px" height="95px">
			</td>
			<td>
				<a href="product_content.jsp?p_num=<%=vo.getP_num() %>">
					<%=vo.getP_name() %>
				</a>
			</td>
			<td>할인가 : <%=vo.getP_saleprice() %>원
				<span class="red">(할인율 : <%=vo.getPercent() %>%)</span>
			</td>
			<td>시중가격 : <%=vo.getP_price() %>원</td>
		</tr>		
<%
		}
	}
%>
		
	</table>

</body>
</html>