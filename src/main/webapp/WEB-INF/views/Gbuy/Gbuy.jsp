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
	function refund() {
		var cf = confirm("정말로 주문을 취소하시겠습니까?");
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
	<h2 class="text-primary">최근 주문 내역</h2>
	<table class="table table-striped">
		<tr>
			<td>날짜</td>
			<td colspan="5">상품정보</td>
			<td>상태</td>
			<td>확인/신청</td>		
		</tr>		
		<c:forEach var="list" items="${gbuy }">
		<form action="GbuyRefund.do" name="frm" method="post">	
			<input type="hidden" name="buy_num" id="buy_num" value="${list.buy_num}">
			<input type="hidden" name="ct_num" id="ct_num" value="${list.ct_num}">
			<input type="hidden" name="pro_num" id="pro_num" value="${list.pro_num}">
			<input type="hidden" name="ct_count" id="ct_count" value="${list.ct_count}">	
			<tr>
				<td>${list.buy_date }</td>
				<td> <img alt="" src="images/${list.pro_image }" class="img-sm"></td>
				<td>${list.pro_name }</td>
				<td>${list.pro_price }/<span class="err">${list.pro_sale }%</span></td>
				<td>${list.ct_count }개</td>
				<td> <fmt:formatNumber value="${list.ct_count * (1 - list.pro_sale/100) * list.pro_price }" pattern="#,###.##"/>원</td>				
				<td>${list.buy_deli }</td>
				<td>
					<c:if test="${list.buy_deli=='상품준비중' }">
						<button class="btn btn-default" onclick="return refund()">주문취소</button>
					</c:if>
					<c:if test="${list.buy_deli=='배송중' }">
						<button class="btn btn-default" id="back">반품하기</button>
					</c:if>
					<c:if test="${list.buy_deli=='배송완료' }">
						<button class="btn btn-default" id="back">반품하기</button>
						<button class="btn btn-default" id="write">상품평 작성</button>
					</c:if>
					<c:if test="${list.buy_deli=='반품완료' }">
						<span class="err">접수완료!</span>
					</c:if>
				</td>					
			</tr>
		</form>
		</c:forEach>	
	</table>
</div>
</body>
</html>