<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Cookie cookie1 = new Cookie("LOGIN", "");
    	cookie1.setValue("");
    	cookie1.setPath("/");
    	cookie1.setMaxAge(0);
    	response.addCookie(cookie1);
    	
    	Cookie cookie2 = new Cookie("ID", "");
    	cookie2.setValue("");
    	cookie2.setPath("/");
    	cookie2.setMaxAge(0);
    	response.addCookie(cookie2);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
로그아웃 되었습니다. 


</body>
</html>