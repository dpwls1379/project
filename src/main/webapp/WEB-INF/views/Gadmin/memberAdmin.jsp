<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="../mainHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<table class="table table-bordered">
		<h3 class="text-primary" align="center">회원 목록</h3>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>주소</th>
			<!-- <th>수정여부</th> -->
			<th>강제탈퇴</th>
		</tr>
		<c:forEach var="gmList" items="${list }">
			<tr>
				<td><a href="mastermempage.do?id=${gmList.id}">${gmList.id}</a></td>
				<td>${gmList.name }</td>
				<td>${gmList.gender }</td>
				<td>${gmList.tel }</td>
				<td>${gmList.addr }</td>
				<%-- <td><a href="updateFormGmem.do?id=${Gmember.id}">수정</a></td> --%>
				<td><a href="gmDelete.do?id=${gmList.id}">강제탈퇴</a></td>
			</tr>
		</c:forEach>
	</table>
<div align="center">
<c:if test="${startPage > PAGEPERBLOCK }">
		<a href="adminList.do?pageNum=${endPage-PAGEPERBLOCK}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="adminList.do?pageNum=${i}" >[${i}]</a>
</c:forEach>
<c:if test="${endPage < totPage }">
		<a href="adminList.do?pageNum=${startPage+PAGEPERBLOCK}">[다음]</a>
</c:if>	
</div>
</div>
</body>
</html>