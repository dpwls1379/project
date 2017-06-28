<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function idChk() {
		if (!frm.id.value) {
			alert("아이디를 입력해 주세요");
			frm.id.focus();
			return false;
		}
		window.open("confirm.do?id="+frm.id.value,"","width=300 height=300");
	}
</script>
</head>
<body>
<div class="container"></div>
<h2 class="text-primary" align="center">회 원 가 입</h2>
<form action="join.do" method="post" name="frm">
	<table class="table table-bordered"> 
		<tr><th>아이디</th><td>
			<input type="text" name="id" required="required">
			<input type="button" value="아이디 중복확인" onclick="return idChk()"></td></tr>
		<tr><th>패스워드</th><td>
			<input type="password" name="pass" required="required"></td></tr>
		<!-- <tr><th>패스워드 확인</th><td>
			<input type="password" name="pass2" required="required"></td></tr> -->
		<tr><th>이름</th><td>
			<input type="text" name="name" required="required"></td></tr>
		<tr><th>성별</th><td>
			<select name="gender">
				<option value="m">남자</option>
				<option value="f">여자</option>
			</select></td></tr>
		<tr><th>생년월일</th><td>
			<input type="date" name="birthday" required="required"></td></tr>
		<tr><th>이메일</th><td>
			<input type="email" name="email" required="required"></td></tr>
		<tr><th>주소</th><td>
			<input type="text" name="addr" required="required"></td></tr>
		<tr><th>전화번호</th><td>
			<input type="tel" name="tel" required="required" pattern="\d{3}-\d{3,4}-\d{4}" 
			title="010-0000-0000 형식으로 입력해 주세요" placeholder="010-0000-0000"></td></tr>
		<tr><th colspan="2">
			<input type="submit" value="가입하기"></tr>
	</table>
</form>
</body>
</html>