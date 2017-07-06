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
$(function () {
	$('#buy').click(function() {
		var cf = confirm("상품을 결제하시겠습니까?");
		if(cf){
			var date= $('#date').val() +" and "+ $("input[name=date]").attr("value");
			$('#buy_delidate').val(date);
			alert(date);
			frm.submit();
		}else{
			return false;
		}
	});
	
	$('input[name=pay]').change(function() {
		var radioval=$(this).val();
		if(radioval=='card'){
			$('#pay').empty().append('<select><option selected="selected">신한카드</option>'
					+'<option>우리카드</option><option>국민카드</option>'
					+'<option>농협카드</option><option>기업카드</option>'
					+'<option>비씨카드</option><option>롯데카드</option>'
					+'<option>삼성카드</option><option>신협카드</option></select> <br>'
					+'<select><option selected="selected">일시불</option>'
					+'<option>무이자할부 3개월</option><option>무이자할부 6개월</option>'
					+'<option>무이자할부 9개월</option><option>무이자할부 12개월</option></select>');
		}

		if(radioval=='account'){
			$('#pay').empty().append('<select>'
					+'<option selected="selected">신한은행 : 123-456-786456</option>'
					+'<option>우리은행 : 123-456-786456</option><option>국민은행 : 123-456-786456</option>'
					+'</select>');
		}
	});
	
});
</script>
</head>
<body>
<div class="container" align="center">
	<form action="GbuyChk.do" method="post" name="frm">
<%-- 		<input type="hidden" name="id" value="${id }"> --%>
		<input type="hidden" name="tot" value="${tot}">
		<input type="hidden" name="buy_delidate" id="buydate" value="">
		<input type="hidden" name="userid" value="${userid }">
		<h2 class="text-primary text-danger" align="center">주문자 정보</h2>
		<table class="table table-bordered">
			<tr><th>주문자 이름</th><td>${member.name}</td></tr>
			<tr><th>주문자 전화</th><td>${member.tel}</td></tr>
			<tr><th>주문자 메일</th><td>${member.email}</td></tr>
		</table><br>
		<h2 class="text-primary text-danger" align="center">배송지 정보</h2>
		<table class="table table-bordered">
			<tr><th>받는분</th><td>${member.name}</td></tr>
			<tr><th>휴대전화</th><td>${member.tel}</td></tr>
			<tr><th>주소</th><td><input type="text" name="buy_addr" value="${member.addr}" class="form-control"></td></tr>
			<tr>
				<th>배송 일자/시간 선택</th>
				<td>
				<input type="date" id="date" required="required">
				<br>
				<input type="radio" name="date" value="10:00~13:00" id="t1">
				<label for="t1">10 : 00 ~ 13 : 00</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="date" value="11:00~14:00" id="t2">
				<label for="t2">11 : 00 ~ 14 : 00</label><br>
				<input type="radio" name="date" value="14:00~17:00" id="t3">
				<label for="t3">14 : 00 ~ 17 : 00</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="date" value="16:00~19:00" id="t4">
				<label for="t4">16 : 00 ~ 19 : 00</label><br>
				<input type="radio" name="date" value="17:00~20:00" id="t5">
				<label for="t5">17 : 00 ~ 20 : 00</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="date" value="19:00~22:00" id="t6">
				<label for="t6">19 : 00 ~ 22 : 00</label><br>
				</td>
			</tr>
			<tr><th>배송시 요청사항</th>
			<td><textarea class="form-control" name="buy_memo"></textarea></td></tr>
		</table><br>
		<h2 class="text-primary text-danger" align="center">주문 상품 정보</h2>
		<table class="table table-bordered">
			<c:forEach var="info" items="${info }">
				<tr>
					<th>이미지</th>
					<td>${info.pro_image }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${info.pro_name }</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>${info.pro_price*(100-info.pro_sale)/100 }</td>
				</tr>
				<tr>
					<th>수량</th>
					<td>${info.ct_count }</td>
				</tr>
				<tr>
					<th>총 가격</th>
					<td>${info.pro_price*(100-info.pro_sale)/100*info.ct_count}</td>
				</tr>
			</c:forEach>
		</table><br>
		<h2 class="text-primary text-danger" align="center">최종결제 정보</h2>
		<table class="table table-bordered">
			<tr><th>상품가격</th><td>${tot }</td></tr>
			<tr><th>결제 수단 선택</th>
				<td>
					<input type="radio" id="card" value="card" name="pay" >
					<label for="card">카드</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" id="account" value="account" name="pay">
					<label for="account">계좌이체</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div id="pay"></div>
				</td>
			</tr>
		</table><br>
		<button id="buy" class="btn btn-info">결제하기</button>
	</form>
</div>
</body>
</html>