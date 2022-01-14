<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendRedirect</title>
</head>
<body>
	구글 홈페이지로 이동 <!-- body 내용은 출력되지 않음 -->
	<%response.sendRedirect("https://www.google.com");%>
	<!-- 요청파일을 출력하지 않고 다른 페이지로 이동하여 응답한 후 출력됨
	response : 응답
	send : 보내다 
	re : 다시
	direct : 직접
	ex : 회원가입 -> 회원가입 완료된 창은 보여주지 않고 로그인 페이지로 이동하는 것 
	 -->
	<!-- 페이지 열리는 창 자체가 구글 -->
</body>
</html>