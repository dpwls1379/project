<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>   
<%@ include file="/WEB-INF/views/mainHeader.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#GproductMain').load("GproductMain.do");
	});
</script>
</head>
<body>
	<div align="center">
		<div id="GproductMain"></div>
	</div>
</body>
</html>