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
		<h2 class="text-primary">주문/배송목록</h2>
		<table class="table table-striped">
			<tr>
				<td>날짜</td>
				<td colspan="5">상품정보</td>
				<td>상태</td>
				<td>확인/신청</td>
			</tr>
			<c:forEach var="list" items="${gbuylist }">
				<c:if test="${id==list.id }">
					<c:if test="${list.buy_deli == '배송완료' }">
						<tr>
							<td>${list.buy_date }</td>
							<td><img alt="" src="images/${list.pro_image }"
								class="img-sm"></td>
							<td>${list.pro_name }</td>
							<td>${list.pro_price }/<span class="err">${list.pro_sale }%</span></td>
							<td>${list.ct_count }개</td>
							<td><fmt:formatNumber
									value="${list.ct_count * (1 - list.pro_sale/100) * list.pro_price }"
									pattern="#,###.##" />원</td>
							<td>${list.buy_deli }</td>
							<td>
								<a class="btn btn-default" href="GbuyReview.do?buy_num=${list.buy_num }">상품평 작성하러 가기</a>
							</td>
						</tr>
					</c:if>
				</c:if>
			</c:forEach>
		</table>
	
	<hr>	
	<table class="table"><tr><td colspan="3" align="left">
	<h3 class="text-primary">내가쓴 상품평</h3></td></tr></table>
	<div class="col-md-12" id="div">
	<div class="col-md-1">번호</div>
	<div class="col-md-2">상품평가</div>
	<div class="col-md-4">내용</div>
	<div class="col-md-1"></div>
	<div class="col-md-2">작성자</div>
	<div class="col-md-2">등록일</div>
	</div>
	<hr class="hr">
	<c:if test="${empty gboardoMy }">
		<div class="col-md-12">평가 게시물이 없습니다</div>
	</c:if>	
	<c:forEach var="olist" items="${gboardoMy }"> 					
		<c:if test="${not empty olist }">			
			<c:if test="${olist.bo_del=='n' }">
				<div class="col-md-12" id="div2">
					<div class="col-md-1">
						${olist.bo_num }			
					</div>
					<div class="col-md-2">
						<c:if test="${olist.bo_star==1 }">★☆☆☆☆</c:if>
						<c:if test="${olist.bo_star==2 }">★★☆☆☆</c:if>
						<c:if test="${olist.bo_star==3 }">★★★☆☆</c:if>
						<c:if test="${olist.bo_star==4 }">★★★★☆</c:if>
						<c:if test="${olist.bo_star==5 }">★★★★★</c:if>
					</div>
					<div class="col-md-4" id="subject">					
						${olist.bo_content }
					</div>
					<div class="col-md-1">
						<c:if test="${olist.bo_image==null}"></c:if>
						<c:if test="${olist.bo_image!=null}">
							<img src="${path}/images/${olist.bo_image }" width="50" height="50">
						</c:if>						
					</div>
					<div class="col-md-2">
						${olist.id }
					</div>
					<div class="col-md-2">
						${olist.bo_date }
					</div>
				</div>
			</c:if>					
		</c:if>		
	</c:forEach>
	</div>
</body>
</html>