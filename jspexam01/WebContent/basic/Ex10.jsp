<%--
에러페이지 실습을 위한 페이지.
실습방법
1. 그냥 바로 실행항 web.xml파일에 지정된 500에러 페이지 응답 확인 
2. 아래 주석처리 된 
	에러페이지를 지정하는 페이지, 디렉티브의 주석을 제거하여 404에러 페이지 응답 확인
--%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8" %>
   <%-- 이게 404 <%@ page errorPage="error.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>파라미터 출력</title>
</head>
<body>
	name 파라미터 값 : 
	<%= request.getParameter("name").toUpperCase() %>
</body>
</html>