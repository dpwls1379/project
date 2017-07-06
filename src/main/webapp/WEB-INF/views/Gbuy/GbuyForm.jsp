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
	function buy() {
		var cf = confirm("상품을 결제하시겠습니까?");
		if(cf) {
			frm.submit();
		} else {
			return false;
		}
	}
</script>
</head>
<body>
<div class="container" align="center">
	<form action="GbuyChk.do" method="post" name="frm">
<%-- 		<input type="hidden" name="id" value="${id }"> --%>
		<input type="hidden" name="tot" value="${tot}">
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
				<td></td>
			</tr>
			<tr><th>배송시 요청사항</th>
			<td><textarea class="form-control" name="buy_memo"></textarea></td></tr>
		</table><br>
		<h2 class="text-primary text-danger" align="center">상품정보 정보</h2>
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
		</table><br>
		<button onclick="return buy()" class="btn btn-info">결제하기</button>
	</form>
</div>
</body>
</html>