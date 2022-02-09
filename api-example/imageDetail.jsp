<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 정보</title>
<style>
img {
  width: 500px;
  height: 300px;
  object-fit: contain;
}
</style>
</head>
<body>
<h3>이미지 정보</h3>
파일명: ${name}<br>
수정한날짜: ${lastModified}<br>
크기: ${length} byte<br>
<img alt="" src="${pageContext.request.contextPath}/img?fileName=${name}">
</body>
</html>