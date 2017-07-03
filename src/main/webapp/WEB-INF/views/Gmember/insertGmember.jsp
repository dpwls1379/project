<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.dao.*,project.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Gmember mem = new Gmember();
	GmemberDao gd = new GmemberDaoImpl();
	for (int i = 1; i <=200; i++) {
		mem.setId("k"+i);
		mem.setPass("k"+i);
		mem.setName("회은"+i);
		mem.setAddr("서울 강남 "+i);
		mem.setTel("011-1111-111"+i);
		mem.setEmail("'${id)'+@k.com");
		mem.setGender("M");
		mem.setBirthday("19930221");
		gd.insert(mem);
	}
%>
입력완료
</body>
</html>