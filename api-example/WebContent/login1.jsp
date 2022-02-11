<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<p>로그인1</p>
<p>아이디와 비밀번호를 동일하게 입력하면 로그인 성공!</p>
<form action="${pageContext.request.contextPath}/login1" method="post">
<input type="text" name="id" placeholder="아이디" required><br>
<input type="text" name="pw" placeholder="비밀번호" required><br>
<input type="submit" value="로그인">
</form>
</body>
</html>