<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../idSession.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="container">
		<table class="table table-bordered">
			<caption class="text-primary">채팅</caption>
			
			<tr>
				<td>
					<input type="button" value="입장" id="enterBtn" class="btn btn-success btn-sm">
				</td>
			</tr>
			<tr>
				<td>
					<pre class="" id="chatArea">
						
					</pre>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="message" required="required">
					<input type="button" value="전송" class="btn btn-defualt btn-sm">
				</td>
			</tr>
			
		</table>
	</div>
</body>
</html>