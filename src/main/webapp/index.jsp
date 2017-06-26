<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#GproductMain').load("GproductMain.do");
	});
</script>
</head>
<body>
	<div class="container" align="center">
		<form action="GproductSearch.do">
			갤러리다
			<input type="text" name="search">
			<input type="submit" value="검색">
		</form>
		<a href="GproductList.do"><button type="button" class="btn btn-default">상품정보</button></a>
		<a href="Gcenter.do"><button type="button" class="btn btn-default" id="center">고객센터</button></a>
	</div>
	<div class="container" align="center">
		<div id="GproductMain"></div>
	</div>
</body>
</html>