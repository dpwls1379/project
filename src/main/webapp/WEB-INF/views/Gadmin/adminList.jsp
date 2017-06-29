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
<h3 class="text-primary" align="center">관리페이지</h3>
	<a href="memberAdmin.do" target="m">
		<button type="button" class="btn btn-primary btn-lg">회원관리</button></a><p>
	<a href="boardAdmin.do" target="b">
		<button type="button" class="btn btn-primary btn-lg">게시판 관리</button></a><p>
	<a href="productAdmin.do" target="p">
		<button type="button" class="btn btn-primary btn-lg">상품 관리</button></a><p>
</div>
</body>
</html>