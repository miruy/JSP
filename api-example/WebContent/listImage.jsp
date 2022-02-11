<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 목록</title>
</head>
<body>
<p>보통 이미지파일이나 비디오파일은 데이터베이스에 파일의 경로를 문자열로 저장하고</p>
<p>브라우저에서 &lt;img src='파일경로' &gt;태그나 &lt;video src='파일경로'&gt;태그에 src속성으로 요청하도록 하여
서버에서는 해당 파일을 응답해주도록 하는 것이 일반적이다.</p>
<p>&lt;a href='파일경로' download/>&gt;와 같이 download속성을 주면
클릭 시 브라우저에 결과를 표시하지 않고 바로 다운로드 된다. </p>
<h3>이미지 목록</h3>
<table>
<c:forEach varStatus="i" var="name" items="${fileNameList}">
	<tr><td>${i.count}.</td> 
	<td><a href="${pageContext.request.contextPath }/img?fileName=${name}">${name}</a></td>
	<td><a href="${pageContext.request.contextPath }/imgDetail?fileName=${name}">자세히</a></td>
	<td><a href="${pageContext.request.contextPath }/img?fileName=${name}" download>[다운로드]</a></td>
</c:forEach>
</table>
</body>
</html>