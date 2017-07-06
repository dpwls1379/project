<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../mainHeader.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function delchk() {
		var cf = confirm("정말로 삭제하시겠습니까?");
		if(cf==true) {
			location.href="GboardxDelete.do?bx_num=${content.bx_num }&bx_categ=${content.bx_categ}";
		} else {
			return false;
		}
	}	
	$(function() {
		$('#list').load('GboardxList.do table');
	});
	$(function() {
		$('#list2').load('GboardxList2.do table');
	});
	$(function() {
		$('#repList').load('GreplyxList.do?bx_num=${content.bx_num }');
	});
	$(function() {
		$('#repInsert').load('GreplyxForm.do?bx_num=${content.bx_num }');
	});
</script>
<style type="text/css">
	#pre { font-size: medium;}
</style>
</head>
<body>
<div class="container">
	<table class="table table-hover">
		<tr>
			<td colspan="1">제목</td><td colspan="5">${content.bx_subject }</td>
		</tr>
		<tr>
			<td>아이디</td><td>${content.id }</td>
			<td>작성일</td><td>${content.bx_date }</td>
			<td>조회수</td><td>${content.bx_read }</td>
		</tr>
		<tr>
			<td colspan="6">내용</td>
		</tr>
		<tr>
			<td colspan="6">			
				<pre id="pre">${content.bx_content }</pre>
				<div align="right">
					<c:if test="${content.bx_categ=='notice' }">
						<a href="GboardxList.do"><button type="button" class="btn btn-default">목록</button></a>
					</c:if>
					<c:if test="${content.bx_categ=='qna' }">
						<a href="GboardxList2.do"><button type="button" class="btn btn-default">목록</button></a>
					</c:if>	
					<a href="GboardxUpdateForm.do?bx_num=${content.bx_num }&id=${content.id}"><button type="button" class="btn btn-default">수정</button></a>
					<button type="button" class="btn btn-default" onclick="return delchk()">삭제</button>
				</div>
			</td>
		</tr>
	</table>
	<c:if test="${content.bx_categ=='qna' }">
		<div id="repList"></div>
		<div id="repInsert"></div>
	</c:if>
	<c:if test="${content.bx_categ=='notice' }">
		<div id="list"></div>
	</c:if>
</div>
</body>
</html>