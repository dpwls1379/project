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
		alert("주문 취소 완료되었습니다");
		location.href="Gbuy.do";
	</script>
</c:if>
<c:if test="${result<=0 }">
	<script type="text/javascript">
		alert("처리 실패");
		hisroty.go(-1);		
	</script>
</c:if>
</body>
</html>