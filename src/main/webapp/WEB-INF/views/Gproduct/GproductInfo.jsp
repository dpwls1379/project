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
	function cart() {
		var id= '${id}';
		if(id === ''){
			alert('로그인 후 장바구니에 담아주십시오');
		}else{
			frm.submit();
		}
	}
	function comma(data_value) {
		return Number(data_value).toLocaleString('en').split(".");
	}
	$(function() {
		$('#review').load('GboardoList.do?pro_num=${gproduct.pro_num}');
	});
	$(function() {
		$('#image').click(
				function() {
					window.open("GproductImage.do?pro_image=${gproduct.pro_image}",
							"상품 이미지", "width=400, height=400");
				});
		$('#plus').click(function() {
			var c = $('#ct_count').val(); //구매 수량s
			var cnt= parseInt($('#pro_cnt').text()); //상품 남은 갯수
			if(c < cnt){
				var count = c++ + 1;
				$('#ct_count').val(count);
				var price = $('#price').val();
				$('#hap').empty().append(comma(price * count) + "원");
			}else{
				alert("구매 가능 수량을 초과하였습니다");
			}
		});
		$('#min').click(function() {
			var c = $('#ct_count').val();
			if (c != 0) {
				var count = c-- - 1;
				$('#ct_count').val(count);
				var price = $('#price').val();
				$('#hap').empty().append(comma(price * count) + "원");
			}
		});
		$('#BuyNow').click(function() {
			var sendData = 'buy_count=' + $('#ct_count').val() + '&&' + 'pro_num=' + $('#pronum').val();
			location.href="buyNow.do?"+sendData;
		});
		
	});
</script>
</head>
<body>
<form action="Gcart.do"  method="post" name="frm">
	<input type="hidden" id="pronum" name="pro_num" value="${gproduct.pro_num }">
	<div class="container" align="center">
 		<input type="hidden" id="price" name="price"
			value="${(100-gproduct.pro_sale)/100*gproduct.pro_price }">	
		<table class="table table-hover">
			<tr>
				<td rowspan="10"><img src="images/${gproduct.pro_image }"
					id="image" width="450" height="450"></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>${gproduct.pro_name }</td>
			</tr>
			<tr>
				<th>할인률</th>
				<td>${gproduct.pro_sale }%</td>
			</tr>
			<tr>
				<th>정가</th>
				<td><fmt:formatNumber value="${gproduct.pro_price }"
						pattern="#,###.###" /> 원</td>
			</tr>
			<tr>
				<th>판매가</th>
				<td><fmt:formatNumber
						value="${(100-gproduct.pro_sale)/100*gproduct.pro_price }"
						pattern="#,###.###" /> 원</td>			
			</tr>
			<tr>
				<th>상품남은개수</th>
				<td id="pro_cnt">${gproduct.pro_count }</td>
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
				<td><a class="btn btn-default btn-sm" id="min">-</a> <input
					type="number" name="ct_count" id="ct_count" value="1" > <a
					class="btn btn-default btn-sm" id="plus">+</a></td>
			</tr>
			<tr>
				<th>합계</th>
				<td><span class="number err" id="hap"><fmt:formatNumber
							value="${(100-gproduct.pro_sale)/100*gproduct.pro_price }"
							pattern="#,###.###" />원 </span></td>
			</tr>
			<tr>
				<td colspan="3" align="right"><c:if test="${gproduct.pro_count>0 }">
						<div class="btn-group">
							<a href="#" class="btn btn-default" onclick="return cart()">장바구니</a> 
							<a href="#" class="btn btn-default" id="BuyNow" >바로구매</a>
						</div>
					</c:if> <c:if test="${gproduct.pro_count<=0 }">
						<div>
							<button type="button" class="btn btn-default">품절이라 상품구매가
								불가능합니다</button>
						</div>
					</c:if></td>
			<tr>
				<td colspan="3">
				<div id="detail">${gproduct.pro_cate } 인기상품</div></td></tr>
			<tr>
				<c:forEach var="rlist" items="${rlist }">
					<td>
						<div align="center">
							<a href="GproductInfo.do?pro_num=${rlist.pro_num }">
							<img class="mouseImg" src="images/${rlist.pro_image }" width="150" height="150">
							</a>
						</div>
						<div class="caption" align="center">
							<p>상품명 : ${rlist.pro_name }</p>
							<p>가격 : ${rlist.pro_price }원</p>
							<p>
								<a href="GproductInfo.do?pro_num=${rlist.pro_num }">상품 자세히 보기</a>
							</p>
						</div>
					</td>
				</c:forEach>
			</tr>
			<tr>
				<td colspan="3">
					<div id="detail">상품상세정보</div>
					<div align="center">
						<img src="${path }/images/${gproduct.pro_info }" width="800">
					</div>
				</td>
			</tr>
		</table>
	</div>
</form>
	<div id="review"></div>
</body>
</html>