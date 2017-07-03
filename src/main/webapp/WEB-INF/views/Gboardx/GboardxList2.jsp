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
	<h3>질문 게시판</h3>
	<table class="table table-hover">
		<tr>
			<td colspan="6">
				<div class="col-md-12">
					<div class="col-md-1" align="center">글번호</div>
					<div class="col-md-6" align="center">제목</div>
					<div class="col-md-2" align="center">작성자</div>
					<div class="col-md-2" align="center">작성일</div>
					<div class="col-md-1" align="center">조회수</div>
				</div>
			</td>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="6">게시물이 없습니다</td>
			</tr>
		</c:if>
		<c:forEach var="list" items="${list }"> 
			<tr>
				<c:if test="${not empty list}">
					<c:if test="${list.bx_del=='n'}">
						<td colspan="6">
							<div class="col-md-12">
								<div class="col-md-1" align="center">${list.bq_num }</div>
								<div class="col-md-6" align="left"><a href="GboardxContent.do?bx_num=${list.bx_num }">${list.bx_subject } [${list.bx_rep}]</a></div>
								<div class="col-md-2" align="center">${list.id }</div>
								<div class="col-md-2" align="center">${list.bx_date }</div>
								<div class="col-md-1" align="center">${list.bx_read }</div>
							</div>
						</td>
					</c:if>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<div align="center">
<ul class="pagination">
	<c:if test="${not empty keyword}">
		<c:if test="${pp.startPage > pp.pagePerBlk }">
			<li><a href="${path }/list/pageNum/${pp.startPage - 1}?search=${search}&keyword=${keyword}">이전</a></li>
		</c:if>
		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
				<a href="${path }/list/pageNum/${i}?search=${search}&keyword=${keyword}">${i}</a></li>
		</c:forEach>
		<c:if test="${pp.endPage < pp.totalPage}">
			<li><a href="${path }/list/pageNum/${pp.endPage + 1}?search=${search}&keyword=${keyword}">다음</a></li>
		</c:if>		
	</c:if>
	<c:if test="${empty keyword}">
		<c:if test="${pp.startPage > pp.pagePerBlk }">
			<li><a href="${path }/list/pageNum/${pp.startPage - 1}">이전</a></li>
		</c:if>
		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
				<a href="${path }/list/pageNum/${i}">${i}</a></li>
		</c:forEach>
		<c:if test="${pp.endPage < pp.totalPage}">
			<li><a href="${path }/list/pageNum/${pp.endPage + 1}">다음</a></li>
		</c:if>		
	</c:if>
</ul>
</div>
	<div align="right">
		<a href="GboardxList2.do"><button type="button" class="btn btn-default">목록</button></a>	
		<a href="GboardxForm2.do"><button type="button" class="btn btn-default">글쓰기</button></a>
	</div>
	<div align="center">
		<form action="search2.do" method="post">
			<select name="serc">
				<option value="id" <c:if test="${serc=='id' }">selected="selected"</c:if>>작성자</option>
				<option value="bx_subject" <c:if test="${serc=='bx_subject' }">selected="selected"</c:if>>제목</option>
				<option value="bx_content" <c:if test="${serc=='bx_content' }">selected="selected"</c:if>>내용</option>
			</select>
			<input type="text" name="serct" <c:if test="${not empty serct }">value="${serct}"</c:if>>
			<input type="submit" value="검색">
		</form>
	</div>
</div>
</body>
</html>