<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.bx_content { resize: none; width: 1000px; height: 150px;}
</style>
</head>
<body>
<div class="container">
	<form action="Greplyx.do?bx_num=${bx_num }" method="post">
	<!-- 	
		아이디는 임시로 입력해서 사용
	-->
		<table class="table table-hover">
			<!-- <tr>
				<td>
					<input type="text" name="id" placeholder="아이디" required="required">
				</td>
			</tr> -->
			<tr>
				<td>
					<div>			
						<textarea name="rex_content" class="bx_content" required="required" maxlength="50" placeholder="댓글을 입력하세요(50자 이내)"></textarea>
						<button type="button" class="btn btn-default" onclick="submit()">댓글입력</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</div>	
</body>
</html>