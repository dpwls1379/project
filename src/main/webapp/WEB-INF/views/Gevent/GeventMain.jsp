<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../mainHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<c:set var="i" value="0" /> <c:set var="j" value="3" /> 
		<table class="table table-hover">
			<tr>
				<td></td></tr>
		<!-- 1S -->
			<tr>
			<c:forEach var="list" items="${list }">
				<td colspan="2"><img src="${path }/images/${list.ev_image  }" width="350" height="200"></td> 
			</c:forEach>	
			</tr>
		<!-- 1E -->
		<!-- 2S -->
		<%-- 
			<c:forEach var="list" items="${list }">
				<c:if test="${i%j == 0 }"> 
			<tr></c:if>
					<td>
						<div align="center">
							<a href="GeventContent.do?ev_num=${list.ev_num }">
							<img class="mouseImg" src="images/${list.ev_image }" width="150" height="150">
							</a>
						</div>
						<div class="caption" align="center">
							<p>${list.ev_content }</p>
							<p><h3>${list.ev_subject }</h3></p>
							<p>
								<a href="GeventContent.do?ev_num=${list.ev_num }">자세히 보기</a>
							</p>
						</div>
					</td>
				<c:if test="${i%j == j-1 }"> 
			</tr></c:if>
				<c:set var="i" value="${i+1 }" /> 
				</c:forEach> 
		--%>
		<!-- 2E -->
		</table>
	</div>
</body>
</html>