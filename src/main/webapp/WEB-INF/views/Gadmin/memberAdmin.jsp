<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<caption>회원 목록</caption>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>수정여부</th>
			<th>삭제여부</th>
		</tr>
		<c:forEach var="mem" items="${gmList }">
			<tr>
				<td>${Gmember.id}</td>
				<td>${Gmember.name }</td>
				<td>${Gmember.tel }</td>
				<td>${Gmember.addr }</td>
				<%-- <td><a href="updateForm.do?deptno=${dept.deptno}">수정</a></td>
		<td><a href="delete.do?deptno=${dept.deptno}">삭제</a></td></tr> --%>
		</c:forEach>
	</table>
</body>
</html>