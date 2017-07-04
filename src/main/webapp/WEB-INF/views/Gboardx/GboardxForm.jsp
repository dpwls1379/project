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
<h2 class="text-primary text-danger">공 지 사 항</h2>
<!-- 로그인 일때만 글작성 가능하게(관리자 아이디만) 나중에 합칠때 설정-->	
<form action="Gboardx.do" name="frm" method="post">
	<input type="hidden" name="bx_categ" value="notice" > 
<!-- 	
	<input type="hidden" value="" name="id">
	아이디는 임시로 입력해서 사용, 카테고리 설정 나중에	
-->
	<table class="table table-hover">
		<tr><th>아이디</th><td colspan="2">${id }</td></tr>
		<tr><th>제목</th><td>
			<input type="text" name="bx_subject" required="required" maxlength="20" placeholder="제목" class="form-control"></td></tr>
		<tr><th>내용</th><td>
			<textarea name="bx_content" class="bx_content" required="required" maxlength="255" placeholder="내용을 입력하세요(255자)"></textarea></td></tr>
		<tr><td><input type="submit" value="작성" class="btn btn-default">
				<input type="reset" value="취소" class="btn btn-default"></td></tr>
	</table>
</form>
</div>
</body>
</html>