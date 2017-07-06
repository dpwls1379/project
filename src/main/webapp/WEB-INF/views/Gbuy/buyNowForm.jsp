<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
    <%@ include file="../mainHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	$('#Gbuy').click(function() {
		var id='${id}';
		if(id === ''){
			alert('로그인 후 결제를 진행하여 주십시오');
		}else{
			location.href="GbuyNowForm.do?pro_num=${gproduct.pro_num}&ct_count=${buy_count}&tot=${buy_price}";

		}
	});
});
</script>
</head>
<body>
<div class="container">
<h2 class="text-primary text-danger" align="center">주문정보 확인</h2><br>
<table class="table table-hover buy">
<tr class="text-primary Tr">
<th colspan="2">상품명/옵션</th>
<th>상품 가격</th>
<th>상품 할인률</th>
<th>구매 갯수</th>
<th>총합계</th>
<th>배송비</th>
</tr>
<tr align="center">
<td>${gproduct.pro_name }</td><td><img alt="" src="images/${gproduct.pro_image }" width="100" height="100"></td>
<td><fmt:formatNumber value="${gproduct.pro_price }" pattern="#,###.##"/>원</td>
<td class="err">${gproduct.pro_sale }% <br><br> ${totalsale }원</td>
<td>${buy_count }</td>
<td class="primary"><fmt:formatNumber value="${buy_price }" pattern="#,###.##"/>원</td>
<td class="text_sm">0원<br>출고지별 배송비<br>택배<br>입점업체별 배송<br>선불</td>
</tr>
<tr>
<td colspan="7" align="right"><a class="btn btn-success" id="Gbuy">결제하기</a></td>
</tr>
</table>
</div>
</body>
</html>