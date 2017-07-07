<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
    <%@ include file="../mainHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {

});
</script>
</head>
<body>
<div class="container">
<h2 class="text-primary">회원 주문관리</h2>
<table class="table table-hover">
<tr>
	<th>고객 아이디</th>
	<th>배송지 주소</th>
	<th>구매 날짜</th>
	<th>원하는 배송날짜</th>
	<th colspan="3">상품 정보</th>
	<th>상품 수량</th>
	<th>총 결제 가격</th>
	<th>배송 상태</th>
	<th></th>
</tr>
<c:forEach var="blist" items="${gbuylist }">
	<c:if test="${blist.buy_deli=='배송준비중' }">
	<tr>
		<td>${blist.id }</td>
		<td>${blist.buy_addr }</td>
		<td>${blist.buy_date }</td>
		<td>${blist.buy_delidate }</td>
		<td><a href="GproductInfo.do?pro_num=${blist.pro_num }">
				<img alt="상품상세보기" src="images/${blist.pro_image }" class="img-sm"></a></td>
		<td>${blist.pro_name }</td>
		<td>${blist.pro_price }/<span class="err">${blist.pro_sale }%</span></td>
		<td>${blist.ct_count }</td>
		<td>${blist.ct_count * (1 - blist.pro_sale/100) * blist.pro_price }원</td>
		<td>${blist.buy_deli }</td>
		<td>
		<a href='Gbuying.do?buy_num=${blist.buy_num}' class="btn btn-success btn-sm">배송중</a>
		<a href='Gbuycomplete.do?buy_num=${blist.buy_num}' class="btn btn-success btn-sm">배송완료</a>
		</td>
	</tr>
	</c:if>
	<c:if test="${blist.buy_deli=='배송중' }">
	<tr>
		<td>${blist.id }</td>
		<td>${blist.buy_addr }</td>
		<td>${blist.buy_date }</td>
		<td>${blist.buy_delidate }</td>
		<td><a href="GproductInfo.do?pro_num=${blist.pro_num }">
				<img alt="상품상세보기" src="images/${blist.pro_image }" class="img-sm"></a></td>
		<td>${blist.pro_name }</td>
		<td>${blist.pro_price }/<span class="err">${blist.pro_sale }%</span></td>
		<td>${blist.ct_count }</td>
		<td>${blist.ct_count * (1 - blist.pro_sale/100) * blist.pro_price }원</td>
		<td>${blist.buy_deli }</td>
		<td>
		<a href='Gbuycomplete.do?buy_num=${blist.buy_num}' class="btn btn-success btn-sm">배송완료</a>
		</td>
	</tr>
	</c:if>
</c:forEach>
</table>
</div>
</body>
</html>