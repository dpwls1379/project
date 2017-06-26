<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function cl() {
		opener.frm.id.value = "${id}";
		window.close();
	}
</script>
</head>
<body>
<c:if test="${result > 0 }">
	<h3>이미 있는 아이디입니다</h3>
	<h3>다른 아이디를 입력하세요</h3>
<form>
<table>
	<tr><th>아이디</th><td>
		<input type="text" name="id" required="required"></td></tr>
	<tr><th colspan="2">
		<input type="submit" value="확인"></th></tr>
</table></form>
</c:if>
<c:if test="${result <= 0 }">
	<h3>사용 가능한 아이디 입니다</h3>
<button onclick="cl()">닫기</button>
</c:if>
</body>
</html>