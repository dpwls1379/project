<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../mainHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#detail {
	font: 200;
	font-size: 23px;
	border: 3px;
	border-bottom-style: solid;
	padding-bottom: 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#review').load('GboardoList.do?pro_num=${list.pro_num}');
	});
	$(function() {
		$('#image').click(
				function() {
					window.open("GproductImage.do?pro_image=${list.pro_image}",
							"상품 이미지", "width=400, height=400");
				});
	});
</script>
</head>
<body>
	<div class="container" align="center">
		<table class="table table-hover">
			<tr>
				<td rowspan="10"><img src="${path }/images/${list.pro_image }"
					id="image"></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>${list.pro_name }</td>
			</tr>
			<tr>
				<th>할인률</th>
				<td>${list.pro_sale }</td>
			</tr>
			<tr>
				<th>정가</th>
				<td>${list.pro_price }</td>
			</tr>
			<tr>
				<th>판매가</th>
				<td>${(100-list.pro_sale)/100*list.pro_price }</td>
			</tr>
			<tr>
				<th>상품남은개수</th>
				<td>${list.pro_count }</td>
			</tr>
			<tr>
				<th>배송정보</th>
				<td>택배배송 평균 / 2일 이내 배송 (토,일,공휴일 제외)</td>
			</tr>
			<tr>
				<th>배송비</th>
				<td>무료</td>
			</tr>
			<tr>
				<th>구입개수</th>
				<td><input type="number" name="pro_count"></td>
			</tr>
			<tr>
				<th>합계</th>
				<td><span id="hap"></span></td>
			</tr>
<%-- 
				<td>
					<div>${list.pro_name }</div>
					<div id="sale">${list.pro_sale }%</div>
					<div id="price">${list.pro_price }원</div>
					<div id="price2">${(100-list.pro_sale)/100*list.pro_price}원</div>
					<div id="count">${list.pro_count }</div>
					<div id="detail2">택배배송 평균 / 2일 이내 배송 (토,일,공휴일 제외)</div>
					<div id="free">무료</div>
					<div>
						<input type="number" name="pro_count">
					</div>
					<div></div>
				</td>
			</tr> --%>
			<tr>
				<td colspan="3" align="right"><c:if test="${list.pro_count>0 }">
						<div class="btn-group">
							<button type="button" class="btn btn-default">장바구니</button>
							<button type="button" class="btn btn-default">바로구매</button>
						</div>
					</c:if> <c:if test="${list.pro_count<=0 }">
						<div>
							<button type="button" class="btn btn-default">품절이라 상품구매가
								불가능합니다</button>
						</div>
					</c:if></td>
			<tr>
				<td colspan="3">
					<div id="detail">상품상세정보</div>
					<div align="center">
						<img src="${path }/images/${list.pro_info }" width="800">
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div id="review"></div>
</body>
</html>