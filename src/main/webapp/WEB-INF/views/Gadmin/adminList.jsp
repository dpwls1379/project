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
<a href="Gbuy.do" class="btn btn-default btn-sm">구매목록</a>
<h1 class="text-primary text-danger" align="center">관리자 페이지</h1>
<%-- <table class="table table-bordered">
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
	<tr><td colspan="2">
	<input type="button" value="수정하기" onclick="location.href='updateFormGmem.do?id=${gm.id}'" class="btn btn-sm">
	</td></tr>
</table> --%>
	<fieldset>
	<legend class="text-primary text-danger">관리</legend>
		<a href="memberAdmin.do" target="m">
			<button type="button" class="btn btn-default btn-sm">회원관리</button>
		</a>
		<hr>
			<a href="GproductList.do" target="p">
				<button type="button" class="btn btn-default btn-sm">상품 관리</button>
			</a>
		<hr>
			<a href="GeventList.do" target="e">
				<button type="button" class="btn btn-default btn-sm">이벤트 관리</button>
		</a>
		<hr>
			<a href="GdeliList.do">
				<button type="button" class="btn btn-default btn-sm">주문 관리</button>
		</a>
	</fieldset>
	</div>
</body>
</html>