<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
    <%@ include file="../mainHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<%-- 상품 이름: ${gproduct.pro_name } --%>
<%-- 상품 가격: ${gproduct.pro_price }원 --%>
<%-- 상품할인률: ${gproduct.pro_sale }% --%>
<!-- 구매 갯수: ${buy_count } -->
<!-- 총합계 : ${buy_price }원 -->
<table class="table table-hover buy">
<tr class="text-primary">
<th colspan="2">상품명/옵션</th>
<th>상품 가격</th>
<th>상품 할인률</th>
<th>구매 갯수</th>
<th>총합계</th>
<th>배송비</th>
</tr>
<tr>
<td>${gproduct.pro_name }</td><td><img alt="" src="images/${gproduct.pro_image }" width="100" height="100"></td>
<td><fmt:formatNumber value="${gproduct.pro_price }" pattern="#,###.##"/>원</td>
<td class="err">${gproduct.pro_sale }%</td>
<td>${buy_count }</td>
<td class="primary"><fmt:formatNumber value="${buy_price }" pattern="#,###.##"/>원</td>
<td class="text_sm">0원<br>출고지별 배송비<br>택배<br>입점업체별 배송<br>선불</td>
</tr>
</table>
</div>
</body>
</html>