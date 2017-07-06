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
		var chkbox = document.getElementsByName('chkbox');
		var price;
		var fullPrice=0;
		$.each(chkbox,function(index) {	
			$(this).click(function() {	
				if($(this).prop('checked')) {
					price = $(this).parent().siblings('#totprice').text();
					price = parseInt(price);
					fullPrice = fullPrice + price;
					$('#totbuy').empty().append(fullPrice);
				} else {
					price = $(this).parent().siblings('#totprice').text();
					price = parseInt(price);
					fullPrice = fullPrice - price;
					$('#totbuy').empty().append(fullPrice);
				}
			});
		});
		$('#chkboxAll').click(function() {
			var chkbox = document.getElementsByName('chkbox');
			var rowCnt = chkbox.length - 1;
			if($(this).prop("checked")) {﻿
				for(var i=0; i<=rowCnt; i++) {
					if(chkbox[i].type == "checkbox") {
						chkbox[i].checked = true; 
					}	               
				}      
			} else {
				for(var i=0; i<=rowCnt; i++) {
					if(chkbox[i].type == "checkbox") {
						chkbox[i].checked = false; 
					}
				}
			}
		});
		
		var min = document.getElementsByName('min');		
		$.each(min,function(index) {
			$(this).click(function() {
				var c = $(this).next('#ct_count').val();
				var count = c-- -1;
				if(count>=0) {
					$(this).next('#ct_count').val(count);
					price = $(this).parent().prev().text();
					$(this).parent().next().empty().append(count*price);											
					if($(this).parent().siblings('#chk').children('#chkbox').prop('checked')) {
						price = $(this).parent().prev('#price').text();
						price = parseInt(price);
						fullPrice = fullPrice - price;
						$('#totbuy').empty().append(fullPrice);
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
				price = $(this).parent().prev().text();
				$(this).parent().next().empty().append(count*price);
					if($(this).parent().siblings('#chk').children('#chkbox').prop('checked')) {
						price = $(this).parent().prev('#price').text();
						price = parseInt(price);
						fullPrice = fullPrice + price;
						$('#totbuy').empty().append(fullPrice);
				}
			});
		});		
	});	
	function delchk() {
		var userid = "";
		var chkbox = document.getElementsByName("chkbox");
		var chked = false;
		var indexid = false;
		for(i=0; i<chkbox.length; i++) {
			if(chkbox[i].checked) {
				if(indexid) {
					userid = userid + '-';
				}
				userid = userid + chkbox[i].value;
				indexid = true;
			}
		}
		if(!indexid) {
			alert("삭제할 상품을 체크해 주세요");
			return;
		}
		var cf = confirm("삭제 하시겠습니까?");
		if(cf) {
			$('#userid').val(userid);			
			$('#name').submit();
		} 
	}
	function buy() {
		var userid = "";
		var chkbox = document.getElementsByName("chkbox");
		var chked = false;
		var indexid = false;
		for(i=0; i<chkbox.length; i++) {
			if(chkbox[i].checked) {
				if(indexid) {
					userid = userid + '-';
				}
				userid = userid + chkbox[i].value;
				indexid = true;
			}
		}
		if(!indexid) {
			alert("결제할 상품을 체크해 주세요");
			return;
		}
		var cf = confirm("상품을 주문하시겠습니까?");
		if(cf) {
			$('#frm #userid').val(userid);
			alert(userid);
			var totprice = $('#totbuy').text();
			$('#tot').val(totprice);
			$('#frm').submit();
		} 
	}
</script>
</head>
<div class="container">
<form action="GcartDelete.do" id="name" method="post">
	<input type="hidden" id="userid" name="userid">
<%-- 	<input type="hidden" name="id" value="${id}"> --%>
</form>
<form action="GbuyForm.do" method="post" id="frm">
	<input type="hidden" id="userid" name="userid">
	<input type="hidden" name="tot" id="tot">
<%-- 	<input type="hidden" name="id" value="${id}"> --%>
	<table class="table table-hover">
		<tr>	
			<td><input type="checkbox" id="chkboxAll"></td>
			<td colspan="2">상품</td>
			<td>판매가</td>
			<td>수량</td>
			<td id="123">총 가격</td>
		</tr>
		<c:forEach var="cart" items="${gcart }">
			<c:if test="${cart.ct_del.equals('n') }">
				<tr>				
					<td id="chk">
						<input type="checkbox" name="chkbox" id="chkbox" value="${cart.ct_num }">
					</td>				
					<td><img src="${path}/images/${cart.pro_image}" height="70" width="70"></td>
					<td><a href="GproductInfo.do?pro_num=${cart.pro_num }">${cart.pro_name}</a></td>			
					<td id="price" name="price">
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
			</c:if>
		</c:forEach>
		<tr>
			<td colspan="5">결제 예정 금액</td>
			<td colspan="1" id="totbuy"></td>
		</tr>
		<tr>
			<td colspan="6" align="right">
				<button type="button" class="btn btn-default" onclick="delchk()">삭제</button>
				<button type="button" class="btn btn-default" onclick="return buy()">주문결제</button>				
			</td>
		</tr>
	</table>
</form>
</div>
<body>
</body>
</html>