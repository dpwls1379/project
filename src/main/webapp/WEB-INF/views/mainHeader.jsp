<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="idSession.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	$('#chattingDo').click(function() {
		window.open("chatting.do", "채팅창", "width=500, height=400");
	});
});
</script>
</head>
<body>
	<!-- <div class="navbar-header-fixed-top" align="center"> -->
	<div align="center" class="title">
		<h3 class="text-primary">
			<a href="index.jsp"><img alt="" src="images/gallerida3.JPG"></a>
		</h3>
	
		 <ul class="nav nav-pills nav-justified">
	         <li><a href="GproductList.do" class="text-danger">상품정보</a></li>
	         <li><a href="GeventList.do" class="text-danger">이벤트</a></li>
	         <li><a href="Gcenter.do" class="text-danger">고객센터</a></li>
	         <c:if test="${empty id }">
	        	 <li><a href="main.do" class="text-danger">로그인</a></li>
	         </c:if>
	         <c:if test="${not empty id }">
				 <li><a href="GcartList.do" class="text-danger">장바구니</a></li>
		         <li><a href="gmMypage.do" class="text-danger">마이 페이지</a></li>
		         <li><a id="chattingDo" href="#" class="text-danger">채팅</a></li>
		         <li><a href="logout.do" class="text-danger">로그아웃</a></li>
		         <p>
				 <h5 class="text-primary text-danger">${id } 님 환영합니다  !</h5>
			 </c:if>
     	 </ul>
    <br>
    	<form action="GproductSearch.do" role="search">
			<input type="text" name="search"> <input type="submit"
				class="btn btn-sm" value="검색">
		</form>
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