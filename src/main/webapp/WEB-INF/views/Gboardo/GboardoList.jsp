<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#div { margin-bottom: 10px; font-size: 18px; border: 1px; border-style: solid;}
	#div2 { height: 60px;}
</style>
</head>
<body>
<div class="container" align="center" >
	<div class="col-md-12" id="div">
	<div class="col-md-1"></div>
	<div class="col-md-2">상품평가</div>
	<div class="col-md-4">제목</div>
	<div class="col-md-2">구매자</div>
	<div class="col-md-2">등록일</div>
	<div class="col-md-1">조회수</div>
	</div>
	<hr class="hr">
	<c:if test="${empty olist }">
		<div class="col-md-12">평가 게시물이 없습니다</div>
	</c:if>	
	<c:forEach var="olist" items="${olist }"> 					
		<c:if test="${not empty olist }">			
			<c:if test="${olist.bo_del=='n' }">
				<div class="col-md-12" id="div2">
					<div class="col-md-1">
						<c:if test="${olist.bo_image==null}"></c:if>
						<c:if test="${olist.bo_image!=null}">
							<img src="${path}/images/${olist.bo_image }" width="50" height="50">
						</c:if>						
					</div>
					<div class="col-md-2">
						<c:if test="${olist.bo_star==1 }">★☆☆☆☆</c:if>
						<c:if test="${olist.bo_star==2 }">★★☆☆☆</c:if>
						<c:if test="${olist.bo_star==3 }">★★★☆☆</c:if>
						<c:if test="${olist.bo_star==4 }">★★★★☆</c:if>
						<c:if test="${olist.bo_star==5 }">★★★★★</c:if>
					</div>
					<div class="col-md-4" id="subject">					
						${olist.bo_subject }
					</div>
					<div class="col-md-2">
						${olist.id }
					</div>
					<div class="col-md-2">
						${olist.bo_date }
					</div>
					<div class="col-md-1">
						${olist.bo_read }
					</div>
				</div>
			</c:if>					
		</c:if>		
	</c:forEach>
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
	<div align="right" class="col-md-12">
		<a href="GboardoForm.do?pro_num=${pro_num}">
			<button type="button" class="btn btn-default">상품평쓰기</button>
		</a>
	</div>
</div>
</body>
</html>