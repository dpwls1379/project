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
	<h2 class="text-primary">이벤트 입력</h2>
		<form action="Gevent.do" method="post" enctype="multipart/form-data">
			<table class="table table-hover">
				<tr>
					<th>제목</th>
					<td><input type="text" name="ev_subject" required="required"></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td><input type="text" name="ev_content" required="required"></td>
					<!-- <textarea rows="15" cols="30" name="ev_content" required="required"></textarea></td> -->
				</tr>
				
				<tr>
					<th>이미지</th>
					<td><input type="file" name="file1" required="required"></td>
				</tr>		
			</table>
			<hr>
			<input type="reset" value="작성취소" class="btn btn-danger">
			<input type="submit" value="작성완료" class="btn btn-info">
			<a onclick="history.back()" class="btn btn-warning">뒤로가기</a>
	</form>
</div>
</body>
</html>