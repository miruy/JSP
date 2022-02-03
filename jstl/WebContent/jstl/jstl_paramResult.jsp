<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다중 선택 결과</title>
</head>
<body>
	당신이 선택한 항목입니다. 
	<hr>
	<c:forEach var="item" items="${paramValues.item }" varStatus="status">
<!-- 						여러개의 값을 전송하기 위해 paramValues 사용 -->
		${item } 
		<c:if test="${!status.last }"> , </c:if>
	</c:forEach>
</body>
</html>