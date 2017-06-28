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
				<tr>
					<td>${list.pro_num }</td>
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
					<td><a href="GproductUpdateForm.do?pro_num=${list.pro_num }"><button
								type="button" class="btn btn-default">수정</button></a> <a
						href="GproductDelete.do?pro_num=${list.pro_num}"><button
								type="button" class="btn btn-default" onclick="return delchk()">삭제</button></a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div align="right">
			<a href="GproductForm.do">
				<button type="button" class="btn btn-default">상품등록</button>
			</a>
		</div>
	</div>
</body>
</html>