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
			<c:forEach var="list" items="${list }">
			<c:set value="${no }" var="no"></c:set>
				<tr>
					<td>${no }</td>
					<td>${list.pro_cate }</td>
					<td><a href="GproductInfo.do?pro_num=${list.pro_num }">${list.pro_name }</a></td>
					<td>${list.pro_price }</td>
					<td>${list.pro_sale }%</td>
					<td>${(100-list.pro_sale)/100*list.pro_price}</td>
					<td><img src="images/${list.pro_info }" width="30" height="30"></td>
					<td><img src="images/${list.pro_image }" width="30"
						height="30"></td>
					<td>${list.pro_date }</td>
					<td>${list.pro_count }</td>
					<td>${list.pro_sell }</td>
					<c:if test="${not empty id }">
						<c:if test="${id =='master' }">
							<td><a href="GproductUpdateForm.do?pro_num=${list.pro_num }"><button
										type="button" class="btn btn-default">수정</button></a> <a
								href="GproductDelete.do?pro_num=${list.pro_num}"><button
										type="button" class="btn btn-default"
										onclick="return delchk()">삭제</button></a></td>
						</c:if>
					</c:if>
				</tr>
				<c:set var="no" value="${no -1 }"></c:set>
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