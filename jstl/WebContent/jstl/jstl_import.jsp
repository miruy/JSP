<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c:import 태그</title>
</head>
<body>
	c:forTokens.jsp 파일과 변수 모두 포함 <br>
	<c:import url="http://localhost:8080/jstl/jstl/jstl_forTokens.jsp"
			var="data">
	</c:import>
	${data }
</body>
</html>