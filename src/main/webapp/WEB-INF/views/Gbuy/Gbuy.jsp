<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
<%@ include file="../mainHeader.jsp"%>        
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			<tr>
			
				<td>${list.buy_date }</td>
				<td> <img alt="" src="images/${list.pro_image }" class="img-sm"></td>
				<td>${list.pro_name }</td>
				<td>${list.pro_price }</td>
				<td>${list.ct_count }</td>
				<td>${list.pro_price/100*(100-list.pro_sale)}</td>				
				<td>${list.buy_deli }</td>
				<td>
					<c:if test="${list.buy_deli=='배송준비중' }">
						<button>주문취소</button>
					</c:if>
					<c:if test="${list.buy_deli=='배송중' }">
						<button>환불없고 반품할수 있게 설정, 대신 반품버튼 존재</button>
					</c:if>
					<c:if test="${list.buy_deli=='배송완료' }">
						<button>환불없고 반품할수 있게 설정, 반품버튼 존재</button>
						<button>추가로 상품평 등록할수 있게 설정, 추가로 상품평등록평 생긴다</button>
					</c:if>
				</td>	
					
			</tr>
	</c:forEach>	
	</table>
</div>
</body>
</html>