<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%-- <%@ include file="../mainHeader.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#detail {
	font: 250;
	font-size: 23px;
	border: 3px;
	border-bottom-style: solid;
	padding-bottom: 15px;
	padding-top: 15
}
</style>
<!-- <script type="text/javascript">
	$(function() {
		$('#event').load('GeventProduct.do table');
	});
</script> -->
</head>
<body>
	<div class="container" align="center">
		<table class="table table-hover">
			<tr>
				<td colspan="7" align="center"><img src="images/170706_bn_s.jpg"></td>
			</tr>
			<tr>
				<td colspan="7" align="center"><img src="images/보양정석.jpg">
					<!-- <div id="event"></div> --></td></tr>
			<tr>
				<!-- <td></td> -->
				<td colspan="7" align="center">
				<div id="detail">한정수량 파격가</div></td></tr>
			<tr>	
				<td><img src="images/한정수량.png" width="200" height="300"></td>
				<c:forEach var="list4" items="${list4 }">
					<td colspan="2">
						<div align="center">
							<a href="GproductInfo.do?pro_num=${list4.pro_num }">
							<img class="mouseImg" src="images/${list4.pro_image }" width="200" height="200">
							</a>
						</div>
						<div class="caption" align="center">
							<p>상품명 : ${list4.pro_name }</p>
							<p>가격 : ${list4.pro_price }원</p>
							<p>할인율 : ${list4.pro_sale }%</p>
							<%-- <p>
								<a href="GproductInfo.do?pro_num=${list4.pro_num }">상품 자세히 보기</a>
							</p> --%>
						</div>
					</td>
				</c:forEach>
			</tr>
			<tr>		
				<!-- <td>많이 팔린 상품 5</td> -->
				<td colspan="7" align="center">
				<div id="detail">많이 팔린 상품</div></td></tr>
			<tr>	
				<c:forEach var="list" items="${list }">
					<td>
						<div align="center">
							<a href="GproductInfo.do?pro_num=${list.pro_num }">
							<img class="mouseImg" src="images/${list.pro_image }" width="150" height="150">
							</a>
						</div>
						<div class="caption" align="center">
							<p>상품명 : ${list.pro_name }</p>
							<p>가격 : ${list.pro_price }원</p>
							<p>
								<a href="GproductInfo.do?pro_num=${list.pro_num }">상품 자세히 보기</a>
							</p>
						</div>
					</td>
				</c:forEach>
			</tr>
			<tr>
				<!-- <td>많이 살펴본 상품 5</td> -->
				<td colspan="7" align="center">
				<div id="detail">많이 본 상품</div></td></tr>
			<tr>	
				<c:forEach var="list2" items="${list2 }">
					<td>
						<div align="center">
							<a href="GproductInfo.do?pro_num=${list2.pro_num }">
							<img class="mouseImg" src="images/${list2.pro_image }" width="150" height="150">
							</a>
						</div>
						<div class="caption" align="center">
						<p>상품명 : ${list2.pro_name }</p>
						<p>가격 : ${list2.pro_price }원</p>
						<p>
							<a href="GproductInfo.do?pro_num=${list2.pro_num }">상품 자세히 보기</a>
						</p> 
						</div>
					</td>
				</c:forEach>
			</tr> 
			<tr>
				<!-- <td>좋은 평가를 받은 상품 5</td> -->
				<td colspan="7" align="center">
				<div id="detail">상품평 우수상품</div></td></tr>
			<tr>	
				<c:forEach var="list3" items="${list3 }">
					<td>
						<div align="center">
							<a href="GproductInfo.do?pro_num=${list3.pro_num }">
							<img class="mouseImg" src="images/${list3.pro_image }" width="150" height="150">
							</a>
						</div>
						<div class="caption" align="center">
						<p>상품명 : ${list3.pro_name }</p>
						<p>가격 : ${list3.pro_price }원</p>
						<p>
							<a href="GproductInfo.do?pro_num=${list3.pro_num }">상품 자세히 보기
							</a>
						</p>
						</div>
					</td>
				</c:forEach>
			</tr>
		</table>
	</div>
</body>
</html>