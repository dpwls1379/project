<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("회원 탈퇴되었습니다.");
		location.href="loginForm.do";
	</script>
</c:if>
<c:if test="${result <= 0 }">
	<script type="text/javascript">
		alert("정말 탈퇴하실 거예요 ?");
		history.go(-1);
	</script>
</c:if>
</body>
</html>