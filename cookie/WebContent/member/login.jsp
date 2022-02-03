<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if(id.equals(password)){
		//아이디와 암호가 서로 같으면 로그인 성공으로 판단
		Cookie cookie1 = new Cookie("LOGIN", "SUCCESS");
		cookie1.setPath("/");
		response.addCookie(cookie1);
		
		Cookie cookie2 = new Cookie("ID", id);
		cookie2.setPath("/");
		response.addCookie(cookie2);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
	로그인에 성공했습니다. 
</body>
</html>
<%} else{	//로그인 실패 시 %>
<script>
alert("로그인에 실패하였습니다.");
history.go(-1);
</script>
<%} %>



















