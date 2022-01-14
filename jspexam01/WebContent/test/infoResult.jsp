<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.Enumeration"
	
%>
	<% 
	request.setCharacterEncoding("utf-8");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
</head>
<body>
		입력한 정보는 아래와 같습니다.<br>
		ID : <%=request.getParameter("ID") %><Br>
		Password : <%=request.getParameter("Password") %><Br>
	 	자기소개 : <%=request.getParameter("자기소개") %>
</body>
</html>