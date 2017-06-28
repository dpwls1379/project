<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="navbar-header-fixed-top" align="center">
		<div align="center">
			<h3 class="text-primary">
				<a href="index.jsp"><img src="images/gallerida3.JPG"></a>
			</h3>
			<form action="GproductSearch.do" role="search">
				<input type="text" name="search"> 
				<input type="submit" class="btn btn-sm" value="검색">
			</form> 
			<a href="GproductList.do">
				<button type="button" class="btn btn-default btn-sm">상품정보</button></a> 
			<a href="Gcenter.do">
				<button type="button" class="btn btn-default btn-sm" id="center">고객센터</button></a>
			<a href="main.do">
				<button type="button" class="btn btn-default btn-sm" id="center">로그인</button></a>
			<hr>
		</div>
	</div>
	<div class="navbar navbar-fixed-bottom" align="center">
		<div class="navbar-footer">
			<a href="Gcenter.do"><button type="button" 
					class="btn btn-default btn-sm" id="center">고객센터</button></a>
					
			<a onclick="history.back()"><button type="button" 
					class="btn btn-default btn-sm" id="center">뒤로가기</button></a>
			<hr>
		</div>
	</div>
</body>
</html>