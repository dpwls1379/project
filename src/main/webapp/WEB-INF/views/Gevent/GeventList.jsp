<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../mainHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function delchk() {
		var cf = confirm("삭제하시겠습니까?");
		if (cf == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<table class="table table-hover">
			<tr>
				<td>번호</td>
				<td>이미지</td>
				<td>제목</td>
				<td>기간</td>
				<td>등록일</td>
				<td>조회수</td>
				<td></td>
			</tr>
			<c:forEach var="gevent" items="${list}">
			<c:set value="${no }" var="no"></c:set> 
				<tr>
					<td>${no}</td>
				<%-- <tr>
					<td>${list.ev_num }</td>
					<td><a href="GeventContent.do?ev_num=${list.ev_num }">${list.ev_subject }</a></td>
					<td><img src="images/${list.ev_image }" width="30" height="30"></td>
					<td>${list.ev_date }</td>
					<c:if test="${not empty id }">
						<c:if test="${id =='master' }">
							<td><a href="GeventUpdateForm.do?eve_num=${list.ev_num }"><button
										type="button" class="btn btn-default">수정</button></a> <a
								href="GeventDelete.do?pro_num=${list.ev_num}"><button
										type="button" class="btn btn-default"
										onclick="return delchk()">삭제</button></a></td>
						</c:if>
					</c:if>
				</tr> 
				<tr>
					<td>${gevent.ev_num }</td> --%>
					<td><img src="images/${gevent.ev_image }" width="30" height="30"></td>
					<td><a href="GeventContent.do?ev_num=${gevent.ev_num }">${gevent.ev_subject }</a></td>
					<td>${gevent.ev_content }</td>
					<td>${gevent.ev_date }</td>
					<td>${gevent.ev_read }</td>
					<c:if test="${not empty id }">
						<c:if test="${id =='master' }">
							<td><a href="GeventUpdateForm.do?ev_num=${gevent.ev_num }">
								<button type="button" class="btn btn-default">수정</button></a> 
							<a href="GeventDelete.do?ev_num=${gevent.ev_num}">
								<button type="button" class="btn btn-default"
								onclick="return delchk()">삭제</button></a></td>
						</c:if>
					</c:if>
				</tr>
				<c:set value="${no -1 }" var="no"></c:set>
			</c:forEach>
		</table>
<!-- 페이징 ~ -->
<div align="center">
<ul class="pagination">
	<c:if test="${pp.startPage > pp.pagePerBlk }">
		<li><a href="GeventList.do?pageNum=${pp.startPage - 1}">이전</a></li>
	</c:if>
	<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
		<li <c:if test="${pp.currentPage==i}">class="active pg"</c:if>>
			<a href="GeventList.do?pageNum=${i}">${i}</a></li>
	</c:forEach>
	<c:if test="${pp.endPage < pp.totalPage}">
		<li><a href="GeventList.do?pageNum=${pp.endPage + 1}">다음</a></li>
	</c:if>		
</ul>
</div>
<!-- ~ 페이징 -->
		<div align="right">
			<c:if test="${not empty id }">
				<c:if test="${id =='master' }">
					<a href="GeventForm.do">
						<button type="button" class="btn btn-default">이벤트등록</button>
					</a>
				</c:if>
			</c:if>
		</div>
	</div>
</body>
</html>