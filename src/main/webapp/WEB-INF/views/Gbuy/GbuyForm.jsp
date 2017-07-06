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
<div class="container">
	<form action="GbuyChk.do" method="post" name="frm">
<%-- 		<input type="hidden" name="id" value="${id }"> --%>
		<input type="hidden" name="tot" value="${tot}">
		<input type="hidden" name="userid" value="${userid }">
		<h2>주문자 정보</h2>
		<table>
			<tr><td>주문자 이름</td><td>&nbsp;&nbsp;&nbsp;&nbsp;${member.name}</td></tr>
			<tr><td>주문자 전화</td><td>&nbsp;&nbsp;&nbsp;&nbsp;${member.tel}</td></tr>
			<tr><td>주문자 메일</td><td>&nbsp;&nbsp;&nbsp;&nbsp;${member.email}</td></tr>
		</table>
		<h2>배송지 정보</h2>
		<table>
			<tr><td>받는분</td><td>${member.name}</td></tr>
			<tr><td>휴대전화</td><td>${member.tel}</td></tr>
			<tr><td>주소</td><td><input type="text" name="buy_addr" value="${member.addr}"></td></tr>
			<tr><td>배송시 요청사항</td></tr>
			<tr><td><textarea name="buy_memo"></textarea></td></tr>
		</table>
		<h2>상품정보 정보</h2>
		<table>
			<c:forEach var="info" items="${info }">
				<tr>
					<td>이미지</td>
					<td>${info.pro_image }</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${info.pro_name }</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${info.pro_price*(100-info.pro_sale)/100 }</td>
				</tr>
				<tr>
					<td>수량</td>
					<td>${info.ct_count }</td>
				</tr>
				<tr>
					<td>총 가격</td>
					<td>${info.pro_price*(100-info.pro_sale)/100*info.ct_count}</td>
				</tr>
			</c:forEach>
		</table>
		<h2>최종결제 정보</h2>
		<table>
			<tr><td>상품가격</td><td>${tot }</td></tr>
		</table>
		<button onclick="return buy()">결제하기</button>
	</form>
</div>
</body>
</html>