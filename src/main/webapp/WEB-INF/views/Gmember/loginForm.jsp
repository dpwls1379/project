<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h2 class="text-primary" align="center">로그인</h2>
<form action="login.do">
<table class="table table-bordered">
	<tr><th>아이디</th><td>
		<input type="text" name="id" required="required"></td></tr>
	<tr><th>패스워드</th><td>
		<input type="password" name="pass" required="required"></td></tr>
	<tr><th colspan="2">
		<input type="submit" value="LOGIN" class="btn btn-default btn-lg"></th></tr>
</table>
</form>
<form action="joinForm.do">
	<tr><th colspan="1">
		<input type="submit" value="회원가입" class="btn btn-success"></th></tr>
</form>
<%-- <button class="btn btn-success" onclick="location.href='${path}/gmember/joinForm.jsp'">회원가입</button> --%>
</div>
</body>
</html>