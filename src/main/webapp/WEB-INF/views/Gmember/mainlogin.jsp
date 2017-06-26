<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include flie="../mainHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Virtual Main Page</h1>

<form action="logout.do">
<table>
	<tr><th colspan="1">
		<input type="submit" value="로그아웃" class="btn btn-danger"></th></tr>
</table>
</form>

<form action="updateFormGmem.do">
<table>
	<tr><th colspan="1">
		<input type="submit" value="회원정보수정" class="btn btn-info"></th></tr>
</table>
</form>

<form action="gmemberLeave.do">
<table>
	<tr><th colspan="1">
		<input type="submit" value="회원탈퇴" class="btn btn-primary"></th></tr>
</table>
</form>
</body>
</html>