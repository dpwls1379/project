<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<%@ include file="../mainHeader.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('.image').click(function() {
			window.open("GproductImage.do?pro_image=${cart.pro_image}",
					"상품 이미지", "width=400, height=400");
		});
	});
	$(function() {
		$('#chkboxAll').click(function() {
			if($('#chkboxAll').prop('checked')) {
				$('.chkbox').each(function() {
					$('.chkbox').attr('checked','checked');
				});
			} else {
				$('.chkbox').each(function() {
					$('.chkbox').removeAttr('checked');
				});
			}
		});
	});
</script>
</head>
<form action="" method="post" name="frm">
	<input type="hidden" name="id" value="${id}">
	<table class="table table-hover">
		<tr>	
			<td><input type="checkbox" id="chkboxAll"></td>
			<td colspan="2">상품</td>
			<td>개당 가격</td>
			<td>할인율</td>
			<td>수량</td>
			<td>가격</td>
			<td></td>
		</tr>
		<c:forEach var="cart" items="${gcart }">
			<tr>
				<td><input type="checkbox" name="chkbox" class="chkbox"></td>
				<td><img src="${path}/images/${cart.pro_image}" height="100" width="100" class="image"></td>
				<td><a href="GproductInfo.do?pro_num=${cart.pro_num }">${cart.pro_name}</a></td>			
				<td id="price">${cart.pro_price}</td>
				<td id="sale">${cart.pro_sale}%</td>
				<td><input type="number" name="ct_count" value="${cart.ct_count}" id="count"></td>
				<td id="totprice"></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="1">결제 예정 금액</td>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td colspan="5"><input type="submit" value="주문결제"><input type="button" value="삭제"></td>
		</tr>
	</table>
</form>
<body>
</body>
</html>