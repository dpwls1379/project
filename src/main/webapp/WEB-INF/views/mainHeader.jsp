<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="page-header-fixed-top" align="center">
		<header>
			<h3 class="text-primary">
				<a href="index.jsp">GALLERIDa</a>
			</h3>
			<form action="GproductSearch.do" role="search">
				<input type="text" name="search"> 
				<input type="submit" class="btn btn-sm" value="검색">
			</form>
			<a href="GproductList.do"><button type="button"
					class="btn btn-default btn-sm">상품정보</button></a> 
			<a href="Gcenter.do"><button type="button" 
					class="btn btn-default btn-sm" id="center">고객센터</button></a>
					<c:if test="${id empty }">
			<a href="main.do"><button type="button"
					class="btn btn-default btn-sm" id="center">로그인</button></a>
					</c:if>
					<c:if test="${id not empty }">
			<a href="main.do"><button type="button"
					class="btn btn-default btn-sm" id="center">로그아웃</button></a>
					</c:if>
			<hr>
		</header>
	</div>
</body>
</html>