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
			alert("회원가입완료 !!!!");
			location.href="loginForm.do";
		</script>
</c:if>
<c:if test="${result <= 0 }">
		<script type="text/javascript">
			alert("다시 한번 확인해 주세요ㅠㅠ");
			history.go(-1);
		</script>
</c:if>
</body>
</html>