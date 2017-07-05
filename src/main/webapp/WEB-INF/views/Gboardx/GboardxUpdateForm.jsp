<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>   
<%@ include file="../mainHeader.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.bx_content { resize: none; width: 500px; height: 250px;}
</style>
</head>
<body>
<div class="container" align="center">
<h3 class="text-primary text-danger">글 수정</h3>
<form action="GboardxUpdate.do" name="frm" method="post">
	<input type="hidden" name="bx_num" value="${bx_num }">
	<table class="table table-hover">
		<tr><th>아이디</th><td colspan="2">${id }</td></tr>
		<tr><th>제목</th><td>
			<input type="text" name="bx_subject" required="required" placeholder="제목" class="form-control"></td></tr>
		<tr><th>내용</th><td>
			<textarea name="bx_content" class="bx_content" required="required" maxlength="255" placeholder="수정할 내용을 입력하세요(255자)"></textarea></td></tr>
		<tr><td>
			<input type="submit" value="수정" class="btn btn-default">
			<input type="reset" value="취소" class="btn btn-default"></td></tr>
	</table>
</form>
</div>
</body>
</html>