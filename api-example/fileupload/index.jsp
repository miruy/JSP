<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 예제</title>
</head>
<body>
<ul>
	<li><a href="./uploadForm.jsp">단일 파일 업로드</a></li>
	<li><a href="./multiUploadForm.jsp">다중 파일 업로드</a></li>
	<li><a href="<%= request.getContextPath() %>/upload">서블릿 파일 업로드</a></li>
</ul>
</body>
</html>