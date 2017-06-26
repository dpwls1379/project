<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<table class="table table-hover">
			<tr>
				<td>많이 팔린 상품 5</td>
				<c:forEach var="list" items="${list }">
					<td>
						<div align="center">
							<a href="GproductInfo.do?pro_num=${list.pro_num }">
							<img src="images/${list.pro_image }" width="150" height="150">
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
				<td>많이 살펴본 상품 5</td>
				<c:forEach var="list2" items="${list2 }">
					<td>
						<div align="center">
							<img src="images/${list2.pro_image }" width="150" height="150">
						</div>
						<div class="caption">
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
				<td>좋은 평가를 받은 상품 5</td>
				<c:forEach var="list3" items="${list3 }">
					<td>
						<div align="center">
							<img src="images/${list3.pro_image }" width="150" height="150">
						</div>
						<p>상품명 : ${list3.pro_name }</p>
						<p>가격 : ${list3.pro_price }원</p>
						<p>
							<a href="GproductInfo.do?pro_num=${list3.pro_num }">상품 자세히 보기
							</a>
						</p>
					</td>
				</c:forEach>
			</tr>
		</table>
	</div>
</body>
</html>