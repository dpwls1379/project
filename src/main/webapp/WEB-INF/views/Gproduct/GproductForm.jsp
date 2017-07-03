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
$(function() {
	$('#saleprc').click(function() {
		var price=$('#price').val();
		var sale=100-$('#sale').val();
		$('#saleprice').empty().append(price*sale/100+"원");
	});
});
</script>
</head>
<body>
	<div class="container">
	<h2 class="text-primary">상품입력</h2>
		<form action="Gproduct.do" method="post" enctype="multipart/form-data"><!--  enctype="multipart/form-date" -->
			<table class="table table-hover">
				<tr>
					<th>상품명</th>
					<td><input type="text" name="pro_name" required="required"></td>
				</tr>
				
				<tr>
					<th>카테고리 선택</th>
					<td>
						<select name="pro_cate" required="required">
							<c:forEach var="list" items="${cate }">
								<option value="${list }">${list }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>상품가격</th>
					<td><input type="number" name="pro_price" required="required" id="price"></td>
				</tr>
				
				<tr>
					<th>할인률</th>
					<td><input type="number" name="pro_sale" required="required" id="sale">(%)<button id="saleprc" class="btn btn-default">적용하기</button></td>
				</tr>
				
				<tr><th>할인가</th><td id="saleprice" class="err"></td></tr>
				
				<tr>
					<th>상품상세정보</th>
					<td>
					<!-- <textarea rows="15" cols="30" name="pro_info" required="required"></textarea> -->
					<input type="file" name="pro_info" required="required">
					</td>
				</tr>
				
				<tr>
					<th>상품이미지</th>
					<td><input type="file" name="pro_image" required="required"></td>
				</tr>
				
				<tr>
					<th>상품수량</th>
					<td><input type="number" name="pro_count" required="required"></td>
				</tr>
			</table>
			<hr>
			<input type="reset" value="작성취소" class="btn btn-danger">
			<input type="submit" value="작성완료" class="btn btn-info">
			<a onclick="history.back()" class="btn btn-warning">뒤로가기</a>
		</form>
	</div>
</body>
</html>