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
	<table class="table">
		<h3 class="text-primary text-danger" align="center">회원 목록</h3>
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
<ul class="pagination">
		<c:if test="${pp.startPage > pp.pagePerBlk }">
			<li><a href="memberAdmin.do?pageNum=${pp.startPage - 1}">이전</a></li>
		</c:if>
		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<li <c:if test="${pp.currentPage==i}">class="active pg"</c:if>>
				<a href="memberAdmin.do?pageNum=${i}">${i}</a></li>
		</c:forEach>
		<c:if test="${pp.endPage < pp.totalPage}">
			<li><a href="memberAdmin.do?pageNum=${pp.endPage + 1}">다음</a></li>
		</c:if>		
</ul>
</div>

</div>
</body>
</html>