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
	function chk() {
		if(frm.pro_price.value<0) {
			alert("금액은 -가 될수 없습니다");
			return false;
		}
		if(frm.pro_count.value<0) {
			alert("제품개수는 -가 될수 없습니다");
			return false;
		}
	}
</script>
</head>
<body>
<div class="container">
<form action="GproductUpdate.do" method="post" name="frm">
	<input type="hidden" name="pro_num" value="${pro_num }">
	<table class="table table-hover">
		<tr>
			<td>카테고리</td>
			<td>		
				<select name="pro_cate" required="required">
					<option value="agricultural" selected="selected">농수산물</option>
					<option value="food">가공식품</option>
					<option value="frozen">냉동식품</option>
					<option value="beverage">음료</option>
					<option value="bath">욕실용품</option>
					<option value="sanitation">위생용품</option>
					<option value="kitchen">주방용품</option>
					<option value="interior">홈인테리어</option>
					<option value="fashion">패션/잡화</option>
					<option value="cosmetics">화장품</option>
					<option value="sports">스포츠</option>
					<option value="appliance">가전</option>
					<option value="etc">기타</option>
				</select>
			</td>
				<!-- <select name="pro_cate">
					<option value="appliance" selected="selected">가전제품</option>
					<option value="food">식료품</option>
				</select> -->
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="pro_name" required="required" value="${list.pro_name }"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="number" name="pro_price" required="required" value="${list.pro_price }"></td>
		</tr>
		<tr>
			<td>상품개수</td>
			<td><input type="number" name="pro_count" required="required" value="${list.pro_count }"></td>
		</tr>
		<tr>
			<td>할인율</td>
			<td><input type="number" name="pro_sale" required="required" min="0" max="100" value="${list.pro_sale }">%</td>
		</tr>
		<tr>
			<td>상세정보</td>
			<!-- <td><textarea rows="15" cols="50" name="pro_info"></textarea></td> -->
			<td><input type="file" name="pro_info"></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><input type="file" name="pro_image" required="required"></td>
		</tr>
		<tr>
			<td><input type="submit" value="수정" onclick="return chk()" class="btn btn-success btn-sm"><input type="reset" value="취소" class="btn btn-default btn-sm"></td>
		</tr>
	</table>
</form>
</div>
</body>
</html>