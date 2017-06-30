<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<%@ include file="../mainHeader.jsp"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
/* 		$('.image').click(function() {
			window.open("GproductImage.do?pro_image=${cart.pro_image}", "상품 이미지", "width=400, height=400");
		});
		$('#chkboxAll').click(function() {
			if($('#chkboxAll').prop('checked')) {
				$('#chkbox').each(function() {
					$(this).attr('checked','checked');
				});
			} else {
				$('#chkbox').each(function() {
					$(this).removeAttr('checked');
				});
			}
		}); */
		var chkbox = document.getElementsByName('chkbox');
		$.each(chkbox,function(index) {			
			$(this).click(function() {					
				if($(this).prop('checked')) {
					var price = $(this).parent().siblings('#totprice').text();
					$('#totbuy').empty().append(price);
				} else {
					$('#totbuy').empty();
				}
			});
		});
		var min = document.getElementsByName('min');		
		$.each(min,function(index) {
			$(this).click(function() {
				var c = $(this).next('#ct_count').val();
				var count = c-- -1;
				if(count>=0) {
					$(this).next('#ct_count').val(count);
					var price = $(this).parent().prev().text();
					$(this).parent().next().empty().append(count*price);											
					if($(this).parent().siblings('#chk').children('#chkbox').prop('checked')) {
						var price = $(this).parent().next().text();
						$('#totbuy').empty().append(price);
					}
				} else {
					alert("수량을 -로 할수 없습니다");
				}
			});
		});
		var pls = document.getElementsByName('pls');
		$.each(pls,function(index) {			
			$(this).click(function() {	
				var c = $(this).prev('#ct_count').val();
				var count = c++ +1;
				$(this).prev('#ct_count').val(count);
				var price = $(this).parent().prev().text();
				$(this).parent().next().empty().append(count*price);
/* 				if($(this).parent().siblings('#chk').children('#chkbox').prop('checked')) {
					var price = $(this).parent().next().text();
					$('#totbuy').empty().append(price);
				} */
			});
		});
	});
</script>
</head>
<div class="container">
<form action="" method="post">
	<input type="hidden" name="id" value="${id}">
	<table class="table table-hover">
		<tr>	
			<td><input type="checkbox" id="chkboxAll"></td>
			<td colspan="2">상품</td>
			<td>판매가</td>
			<td>수량</td>
			<td id="123">총 가격</td>
		</tr>
		<c:forEach var="cart" items="${gcart }">
			<tr>
				<td id="chk">
					<input type="checkbox" name="chkbox" id="chkbox">
				</td>
				<td><img src="${path}/images/${cart.pro_image}" height="70" width="70" class="image"></td>
				<td><a href="GproductInfo.do?pro_num=${cart.pro_num }">${cart.pro_name}</a></td>			
				<td id="price">
					<fmt:formatNumber value="${(100-cart.pro_sale)/100*cart.pro_price}" pattern="0"/>
				</td>
				<td>
					<a class="btn btn-default btn-sm" id="minus" name="min">-</a>
					<input type="number" name="ct_count" id="ct_count" value="${cart.ct_count}"> 
					<a class="btn btn-default btn-sm" id="plus" name="pls">+</a>
				</td>
				<td id="totprice">				
					<fmt:formatNumber value="${(100-cart.pro_sale)/100*cart.pro_price*cart.ct_count}" pattern="0"/>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">결제 예정 금액</td>
			<td colspan="1" id="totbuy"></td>
		</tr>
		<tr>
			<td colspan="6" align="right">
				<button type="button" class="btn btn-default">삭제</button>
				<button type="button" class="btn btn-default">주문결제</button>				
			</td>
		</tr>
	</table>
</form>
</div>
<body>
</body>
</html>