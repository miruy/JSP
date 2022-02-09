<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
<c:if test="${not empty id}">
${ id }로 로그인 성공!
<a href="${pageContext.request.contextPath}/logout"><button>로그아웃</button></a>
</c:if>
<c:if test="${empty id}">
미 로그인 상태
</c:if>
</body>
</html>