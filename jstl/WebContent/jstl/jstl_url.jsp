<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c:url 태그 </title>
</head>
<body>
	<c:url value="images/test.png" var="data"></c:url>
	<h3>${data }</h3>
	<img src="${data }" width="150" height="150">
	<h3>${data }</h3>
	<img src="${data }" width="200" height="200">
</body>
</html>