<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<fieldset>
	<legend class="text-primary text-danger">관리자 페이지</legend>
		<a href="memberAdmin.do" target="m">
			<button type="button" class="btn btn-default btn-lg">회원관리</button>
		</a>
		<hr>
			<a href="boardAdmin.do" target="m">
				<button type="button" class="btn btn-default btn-lg">게시판 관리</button>
			</a>
		<hr>
			<a href="GproductList.do" target="p">
				<button type="button" class="btn btn-default btn-lg">상품 관리</button>
			</a>
		<hr>
	</fieldset>
	</div>
</body>
</html>