<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 정보</title>
<style>
video {
  width: 500px;
  height: 300px;
}
</style>
</head>
<body>
<h3>비디오 정보</h3>
파일명: ${name}<br>
수정한날짜: ${lastModified}<br>
크기: ${length} byte<br>
<video autoplay controls muted poster="" preload="auto">
 <source src="${pageContext.request.contextPath}/video?fileName=${name}" type="video/mp4">
</video>

</body>
</html>