<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="idSession.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <div class="navbar-header-fixed-top" align="center"> -->
	<div align="center" class="title">
		<h3 class="text-primary">
			<a href="index.jsp"><img alt="" src="images/gallerida3.JPG"></a>
		</h3>
		<form action="GproductSearch.do" role="search">
			<input type="text" name="search"> <input type="submit"
				class="btn btn-sm" value="검색">
		</form>
		<a href="GproductList.do"><button type="button"
				class="btn btn-default btn-sm">상품정보</button></a> <a href="Gcenter.do"><button
				type="button" class="btn btn-default btn-sm" id="center">고객센터</button></a>
		<c:if test="${empty id }">
			<a href="main.do"><button type="button"
					class="btn btn-default btn-sm" id="center">로그인</button></a>
		</c:if>

		<c:if test="${not empty id }">
			<a href="logout.do">
				<button type="button" class="btn btn-default btn-sm" id="center">로그아웃</button>
			</a>
			<a href="gmMypage.do">
				<button type="button" class="btn btn-default btn-sm" id="center">마이페이지</button>
			</a>
			<p>
			<h5 class="text-primary">${id }님 환영합니다  !</h5>
		</c:if>
		<hr>
	</div>
	<!-- 	</div> -->
	<div class="fix">

		<a onclick="history.back()"><button type="button"
				class="btn btn-default btn-sm" id="center">뒤로가기</button></a>

		<p>
			<a class="btn btn-default btn-sm tp">위로가기</a>
	</div>




</body>
</html>