<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#div2 { margin-bottom: 5px;}
</style>
<script type="text/javascript">
	function delchk() {
		boolean cf = confirm("정말로 삭제하시겠습니까?");
		if(cf==true) {
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
		<c:if test="${empty list}">
			<tr>
				<td>작성된 댓글이 없습니다</td>
			<tr>
		</c:if>		
		<c:if test="${not empty list }">		
			<c:forEach var="list" items="${list }">
				<c:if test="${list.rex_del=='n' }">
					<tr>
						<td>
							<div class="col-md-12" id="div2">
								<div class="col-md-8">${list.id }님 (작성일 : ${list.rex_date })</div>
								<div align="right">
									<a href="GreplyxUpdateForm.do?rex_num=${list.rex_num }&bx_num=${list.bx_num}">
										<button type="button" class="btn btn-default">수정</button>
									</a>
									<a href="GreplyxDelete.do?rex_num=${list.rex_num }&bx_num=${list.bx_num}">
										<button type="button" class="btn btn-default" onclick="return delchk()">삭제</button>
									</a>
								</div>							
							</div>
							<pre>${list.rex_content }</pre>	
						</td>						
					</tr>
				</c:if>
			</c:forEach>				
		</c:if>
	</table>
</div>
</body>
</html>