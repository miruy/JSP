<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendRedirect</title>
</head>
<body>
	구글 홈페이지로 이동
	<%response.sendRedirect("https://www.google.com");%>
	<!-- 페이지 열리는 창 자체가 구글 -->
</body>
</html>