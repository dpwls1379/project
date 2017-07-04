<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>  
<%@ include file="../mainHeader.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">	
	<div>	
		<h2 class="text-danger">Q & A</h2>
		<h5 align="right"><a href="GboardxList2.do">더보기</a></h5>		
	</div>
	<table class="table table-hover">
		<tr>
			<td colspan="6">
				<div class="col-md-12" align="center">
					<div class="col-md-1">글번호</div>
					<div class="col-md-6">제목</div>
					<div class="col-md-2">작성자</div>
					<div class="col-md-2">작성일</div>
					<div class="col-md-1">조회수</div>
				</div>
			</td>
		</tr>
		<c:forEach var="listq" items="${listq }">
			<tr>
				<c:if test="${empty listq }">
					<td colspan="6">게시물이 없습니다</td>
				</c:if>
				<c:if test="${not empty listq}">
					<c:if test="${listq.bx_del=='n'}">
						<td>
							<div class="col-md-12">
								<div class="col-md-1" align="center">${listq.bq_num }</div>
								<div class="col-md-6" align="left"><a href="GboardxContent.do?bx_num=${listq.bx_num }">${listq.bx_subject }[${listq.bx_rep}]</a></div>
								<div class="col-md-2" align="center">${listq.id }</div>
								<div class="col-md-2" align="center">${listq.bx_date }</div>
								<div class="col-md-1" align="center">${listq.bx_read }</div>
							</div>
						</td>
					</c:if>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<hr>
	
	<div>	
		<h2 class="text-danger">공지사항</h2>
		<h5 align="right"><a href="GboardxList.do">더보기</a></h5>
	</div>
	<table class="table table-hover">
		<tr>
			<td colspan="6">
				<div class="col-md-12" align="center">
					<div class="col-md-1">글번호</div>
					<div class="col-md-6">제목</div>
					<div class="col-md-2">작성자</div>
					<div class="col-md-2">작성일</div>
					<div class="col-md-1">조회수</div>
				</div>
			</td>
		</tr>
		<c:forEach var="listn" items="${listn }">
			<tr>
				<c:if test="${empty listn }">
					<td colspan="6">게시물이 없습니다</td>
				</c:if>
				<c:if test="${not empty listn}">
					<c:if test="${listn.bx_del=='n'}">
						<td>
							<div class="col-md-12">
								<div class="col-md-1" align="center">${listn.bn_num }</div>
								<div class="col-md-6" align="left"><a href="GboardxContent.do?bx_num=${listn.bx_num }">${listn.bx_subject }</a></div>
								<div class="col-md-2" align="center">${listn.id }</div>
								<div class="col-md-2" align="center">${listn.bx_date }</div>
								<div class="col-md-1" align="center">${listn.bx_read }</div>
							</div>
						</td>
					</c:if>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</div>	
</body>
</html>