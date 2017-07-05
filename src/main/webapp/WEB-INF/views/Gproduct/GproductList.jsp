<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../mainHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function delchk() {
		var cf = confirm("상품을 삭제하시겠습니까?");
		if (cf == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
	<div id = "category">
		<ul>
			<li><a href="GproductList.do?pro_cate=agricultural" class="btn btn-success">농수산물</a>
			<a href="GproductList.do?pro_cate=food" class="btn btn-success">가공식품</a>
			<a href="GproductList.do?pro_cate=frozen" class="btn btn-success">냉동식품</a>
			<a href="GproductList.do?pro_cate=beverage" class="btn btn-success">음료</a>
			<a href="GproductList.do?pro_cate=bath" class="btn btn-success">욕실용품</a>
			<a href="GproductList.do?pro_cate=sanitation" class="btn btn-success">위생용품</a>
			<a href="GproductList.do?pro_cate=kitchen" class="btn btn-success">주방용품</a>
			<a href="GproductList.do?pro_cate=interior" class="btn btn-success">홈인테리어</a>
			<a href="GproductList.do?pro_cate=fashion" class="btn btn-success">패션/잡화</a>
			<a href="GproductList.do?pro_cate=cosmetics" class="btn btn-success">화장품</a>
			<a href="GproductList.do?pro_cate=sports" class="btn btn-success">스포츠</a>
			<a href="GproductList.do?pro_cate=appliance" class="btn btn-success">가전</a>
			<a href="GproductList.do?pro_cate=etc" class="btn btn-success">기타</a></li>
		</ul>
		</div>
		<table class="table table-hover">
			<tr>
				<td>번호</td>
				<td>종류</td>
				<td>이름</td>
				<td>가격</td>
				<td>할인률</td>
				<td>판매가격</td>
				<td>상세정보</td>
				<td>이미지</td>
				<td>등록날짜</td>
				<td>개수</td>
				<td>판매수</td>
				<td></td>
			</tr>
			<c:forEach var="gproduct" items="${list}">
				<tr>
					<td>${gproduct.pro_num }</td>
					<td>
					<c:if test="${gproduct.pro_cate =='agricultural'}">농수산물</c:if>
					<c:if test="${gproduct.pro_cate =='food'}">가공식품</c:if>
					<c:if test="${gproduct.pro_cate =='frozen'}">냉동식품</c:if>
					<c:if test="${gproduct.pro_cate =='beverage'}">음료</c:if>
					<c:if test="${gproduct.pro_cate =='bath'}">욕실용품</c:if>
					<c:if test="${gproduct.pro_cate =='sanitation'}">위생용품</c:if>
					<c:if test="${gproduct.pro_cate =='kitchen'}">주방용품</c:if>
					<c:if test="${gproduct.pro_cate =='interior'}">홈인테리어</c:if>
					<c:if test="${gproduct.pro_cate =='fashion'}">패션/잡화</c:if>
					<c:if test="${gproduct.pro_cate =='cosmetics'}">화장품</c:if>
					<c:if test="${gproduct.pro_cate =='sports'}">스포츠</c:if>
					<c:if test="${gproduct.pro_cate =='appliance'}">가전</c:if>
					<c:if test="${gproduct.pro_cate =='etc'}">기타</c:if>
					<%-- ${list.pro_cate } --%></td>
					<td><a href="GproductInfo.do?pro_num=${gproduct.pro_num }">${gproduct.pro_name }</a></td>
					<td><fmt:formatNumber value="${gproduct.pro_price }"
						pattern="#,###.###" /></td>
					<td>${gproduct.pro_sale }%</td>
					<td><fmt:formatNumber
						value="${(100-gproduct.pro_sale)/100*gproduct.pro_price }"
						pattern="#,###.###" /></td>
					<td><img src="images/${gproduct.pro_info }" width="30" height="30"></td>
					<td><img src="images/${gproduct.pro_image }" width="30"
						height="30"></td>
					<td>${gproduct.pro_date }</td>
					<td>${gproduct.pro_count }</td>
					<td>${gproduct.pro_sell }</td>
					<c:if test="${not empty id }">
						<c:if test="${id =='master' }">
							<td><a href="GproductUpdateForm.do?pro_num=${gproduct.pro_num }"><button
										type="button" class="btn btn-default">수정</button></a> <a
								href="GproductDelete.do?pro_num=${gproduct.pro_num}"><button
										type="button" class="btn btn-default"
										onclick="return delchk()">삭제</button></a></td>
						</c:if>
					</c:if>
				</tr>
			</c:forEach>
		</table>
<!-- 페이징 ~ -->
<div align="center">
<ul class="pagination">
	<c:if test="${pp.startPage > pp.pagePerBlk }">
		<li><a href="GproductList.do?pageNum=${pp.startPage - 1}">이전</a></li>
	</c:if>
	<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
		<li <c:if test="${pp.currentPage==i}">class="active pg"</c:if>>
			<a href="GproductList.do?pageNum=${i}">${i}</a></li>
	</c:forEach>
	<c:if test="${pp.endPage < pp.totalPage}">
		<li><a href="GproductList.do?pageNum=${pp.endPage + 1}">다음</a></li>
	</c:if>		
</ul>
</div>
<!-- ~ 페이징 -->
		<div align="right">
			<c:if test="${not empty id }">
				<c:if test="${id =='master' }">
					<a href="GproductForm.do">
						<button type="button" class="btn btn-default">상품등록</button>
					</a>
				</c:if>
			</c:if>
		</div>
	</div>
</body>
</html>