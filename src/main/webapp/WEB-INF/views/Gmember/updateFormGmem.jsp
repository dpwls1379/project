<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="../mainHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if (frm.pass.value != frm.pass2.value) {
			alert("패스워드가 패스워드 학인과 다릅니다.");
			frm.pass.focus();
			return false; 
		}
	}
</script>
</head>
<body>
<div class="container">
<h2 class="text-primary" align="center">회 원 정 보 수 정</h2>
<form action="updateGmem.do" method="post" name="frm" onsubmit="return chk()">
	<input type="hidden" name="id" value="${gmember.id }">
<table class="table table-bordered">
	<tr><th>아이디</th><td>
		${gmember.id }</td></tr>
	<tr><th>패스워드</th><td>
		<input type="password" name="pass" required="required"></td></tr>
	<tr><th>패스워드 확인</th><td>
		<input type="password" name="pass2" required="required"></td></tr>
	<tr><th>
	<tr><th>성별</th><td>
		${gmember.gender }
		</td></tr>
	<tr><th>이름</th><td>
		<input type="text" name="name" required="required" value="${gmember.name }"></td></tr>
	<!-- 생년월일 시간 안나오게 수정요망 -->
	<tr><th>생년월일</th><td>
		${gmember.birthday }
	</td></tr>
	<tr><th>이메일</th><td>
		<input type="email" name="email" required="required" value="${gmember.email }"></td></tr>
	<tr><th>주소</th><td>
		<input type="text" name="addr" required="required" value="${gmember.addr }"></td></tr>
	<tr><th>전화번호</th><td>
		<input type="tel" name="tel" required="required" value="${gmember.tel }"></td></tr>
	<tr><th colspan="2">
		<input type="submit" value="수정"></th></tr>
</table>
</form>
</div>
</body>
</html>