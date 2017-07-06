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
<form action="GeventUpdate.do" method="post" name="frm" enctype="multipart/form-data">
	<input type="hidden" name="ev_num" value="${ev_num }">
	<table class="table table-hover">
		
		<tr>
			<td>제목</td>
			<td><input type="text" name="ev_subject" required="required" value="${list.ev_subject }"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="ev_content" required="required" value="${list.ev_content }"></td>
			<%-- <textarea rows="15" cols="50" name="ev_content" value="${list.ev_content }"></textarea></td> --%>
		</tr>
		<tr>
			<td>이미지</td>
			<td><input type="file" name="file1" required="required" value="${list.ev_image }"></td>
		</tr>
		<tr>
			<td><input type="submit" value="수정" class="btn btn-success btn-sm">
			<input type="reset" value="취소" class="btn btn-default btn-sm"></td>
		</tr>
	</table>
</form>
</div>
</body>
</html>