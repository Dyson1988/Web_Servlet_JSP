<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 제품번호에 해당하는 제품번호 리스트 표시 --%>
<%
	//전달받은 파라미터 값 추출
	String pnum = request.getParameter("p_num");
	System.out.println(pnum);
%>
	<%-- 액션태그 useBean은 scope상에 id이름의 속성이 있으면 가져다 사용하고, 없으면 새로 객체를 생성한다. --%>
	<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO" scope="session"></jsp:useBean>
<%
	//DAO 객체 사용해서 제품정보 조회해서 vo에 저장
	//ShopDAO에 selectOne 메소드를 이용하여 DB를 호출시킨다.
	ShopVO vo = dao.selectOne(pnum);
	System.out.println(">> content vo : " + vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세정보</title>
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
	tfoot { height: 3em; text-align: center; }
	.title { width: 40%; }
	.red { color: red; }
</style>
</head>
<body>
	<jsp:include page="shop.jsp"></jsp:include>
	<table>



		<tbody>
			<tr>
				<th  class="title">제품Category</th>
				<td><%=vo.getCategory() %></td>
			</tr>
			<tr>
				<th>제품번호</th>
				<td><%=vo.getP_num() %></td>
			</tr>
			<tr>
				<th>제품이름</th>
				<td><%=vo.getP_name() %></td>
			</tr>
			<tr>
				<th>제품제조사</th>
				<td><%=vo.getP_company() %></td>
			</tr>
			<tr>
				<th>제품가격</th>
				<td>정가 : <%=vo.getP_price() %>원
					<span class="red">(할인가격 :<%=vo.getP_saleprice()%>원)</span>
				</td>
			</tr>
			<tr>
				<th>제품설명</th>
				<td><%=vo.getP_content() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<img src="images/<%=vo.getP_image_l() %>" width="500px" height="495px">
				</td>
			</tr>
		</tbody>

		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="장바구니에 담기" onclick="add()">
					<%-- <input type="button" value="장바구니 보기" onclick="cart_go()"> --%>
					<input type="button" value="장바구니 보기" onclick="javascript:location.href = 'cartList.jsp'">
				</td>
			</tr>
		</tfoot>
	</table>
<script>
	function add() {
		location.href = "addProduct.jsp?p_num=<%=vo.getP_num() %>";
	}
	function cart_go() {
		location.href = "cartList.jsp";
	}
</script>	
</body>
</html>