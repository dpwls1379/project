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
<c:if test="${result>0 }">
	<script type="text/javascript">
		alert("장바구니에 상품을 담았습니다");
		var cf = confirm("장바구니를 확인하시겠습니까?");
		if(cf==true) {
			location.href="GcartList.do?pro_num=${gcart.pro_num}";
		} else {
			history.go(-1);
		}
	</script>
</c:if>
<c:if test="${result<=0 }">
	<script type="text/javascript">
		alert("실패");
		history.go(-1);
	</script>
</c:if>
</body>
</html>