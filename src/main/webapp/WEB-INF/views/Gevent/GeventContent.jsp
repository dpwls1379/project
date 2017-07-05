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
			location.href="GeventDelete.do?ev_num=${content.ev_num }";
		} else {
			return false;
		}
	}
</script>
</head>
<body>
<div class="container">
	<div align="center"><h1 class="text-warning">${content.ev_subject }<hr>(${content.ev_content })</h1></div>
	<div align="center"><img src="${path }/images/${content.ev_image }"></div>
	<%-- <div align="right">
		<a href="GeventUpdateForm.do?ev_num=${content.ev_num }">
		<button type="button" class="btn btn-default">수정</button></a>
		<button type="button" class="btn btn-default" onclick="return delchk()">삭제</button>
	</div> --%>
</div>
</body>
</html>