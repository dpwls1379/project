<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="../mainHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" align="center">
<h1 class="text-primary text-danger" align="center">회 원 정 보</h1>
<table class="table table-bordered">
	<tr><th>아이디</th><td>
		${gm.id }</td></tr>
	<tr><th>이름</th><td>
		${gm.name }</td></tr>
	<tr><th>주소</th><td>
		${gm.addr }</td></tr>
	<tr><th>전화번호</th><td>
		${gm.tel }</td></tr>
	<tr><th>이메일</th><td>
		${gm.email }</td></tr>
	<tr><th>생년월일</th><td>
		${gm.birthday }</td></tr>
	<tr><td colspan="2"><div align="center">
	<input type="button" value="수정하기" onclick="location.href='updateFormGmem.do?id=${gm.id}'" class="btn btn-sm">
	<input type="button" value="탈퇴하기" onclick="location.href='gmemberLeave.do?id=${gm.id}'" class="btn btn-sm"></div></td></tr>
</table>
</div>
</body>
</html>