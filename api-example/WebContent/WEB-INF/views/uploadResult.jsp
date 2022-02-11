<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드 결과</title>
</head>
<body>
<h3>서블릿 업로드 결과</h3>
<c:if test="${empty no}">
	<c:forEach var="uploadFile" items="${uploadFileList}">
		<p>FileName : ${ uploadFile.fileName }</p>
		<p>Size : ${ uploadFile.fileSize }</p>
		<p>ContentType : ${ uploadFile.contentType }</p>
		<hr>
	</c:forEach>
</c:if>
<c:if test="${!empty no}">
	업로드된 파일이 없습니다.
</c:if>
</body>
</html>