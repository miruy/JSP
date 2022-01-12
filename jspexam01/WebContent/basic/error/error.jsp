<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외 발생(에러 파일)</title>
</head>
<body>
내가 만든 error파일<br>
에러 타입 : <%=exception.getClass().getName() %><br>
에러 메세지 : <b><%=exception.getMessage() %></b>
</body>
</html>