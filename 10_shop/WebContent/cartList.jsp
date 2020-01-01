<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- 장바구니에 있는 데이터 화면에 출력 --%>    
 	<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/>
	<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO" scope="session"/>
	
<%
	List<ShopVO> list = cart.getList();	
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
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
	tfoot { text-align: center; font-size: 1.5em; }
</style>
</head>
<body>
	<jsp:include page="shop.jsp"></jsp:include>
	
	<table>
		<thead>
			<tr>
				<td colspan="6">::장바구니 내용</td>
			</tr>
			<tr>
				<th>제품번호</th>
				<th>제품명</th>
				<th>단가</th>
				<th>수량</th>
				<th>금액</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
<%
		if (list == null || list.size() < 1) {
			out.print("<tr><td colspan='6'>");
			out.print("장바구니가 비어 있습니다.");
			out.print("</td></tr>");
			
		} else {
			for (ShopVO svo : list ){ %>
			<tr>
				<td><%=svo.getP_num() %></td>
				<td><%=svo.getP_name() %></td>
				<td>정가 : <%=svo.getP_price() %>원 
					<span class="red">
						(세일가격 : <%=svo.getP_saleprice() %>원) 
					</span>
				</td>
				<td>
				<form action="editQuant.jsp" method="get">
					<input type="text" width="10px" name="su" size="3" value="<%=svo.getQuant() %>">
					<input type="hidden" name="p_num" value="<%=svo.getP_num() %>">
					<input type="submit" value="수정">
				</form>	
				</td>
				<td><%=svo.getTotalprice() %></td>
				<td>
					<input type="button" value="삭제" name="delete" onclick="location.href='delete.jsp?p_num=<%=svo.getP_num() %>'">
				</td>
			</tr>
		</tbody>
<%
		}
	}
%>		
		<tfoot>
			<tr>
				<td colspan="6">총결재금액 : <%=cart.getTotal() %>원</td>
			</tr>
		</tfoot>
	</table>
<script>
	
</script>
</body>
</html>