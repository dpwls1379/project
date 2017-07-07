<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../mainHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2 class="text-primary">취소/반품목록</h2>
		<table class="table table-striped">
			<tr>
				<td>날짜</td>
				<td colspan="5">상품정보</td>
				<td>상태</td>
				<td>상품보러가기</td>
			</tr>
			<c:forEach var="list" items="${gbuylist }">
				<c:if test="${id==list.id }">
					<c:if test="${list.buy_deli == '주문취소완료' || list.buy_deli == '반품완료' }">
						<tr>
							<td>${list.buy_date }</td>
							<td><img alt="" src="images/${list.pro_image }"
								class="img-sm"></td>
							<td>${list.pro_name }</td>
							<td>${list.pro_price }/<span class="err">${list.pro_sale }%</span></td>
							<td>${list.ct_count }개</td>
							<td><fmt:formatNumber
									value="${list.ct_count * (1 - list.pro_sale/100) * list.pro_price }"
									pattern="#,###.##" />원</td>
							<td>${list.buy_deli }</td>
							<td>
								<a class="btn btn-default" href="GbuyReview.do?buy_num=${list.buy_num }">상품보러가기</a>
							</td>
						</tr>
					</c:if>
				</c:if>
			</c:forEach>
		</table>
	</div>
</body>
</html>