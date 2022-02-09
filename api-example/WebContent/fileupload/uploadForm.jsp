<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 전송 폼</title>
</head>
<body>
<h3>단일 파일 업로드</h3>
<form action="uploadProc.jsp" method="post" enctype="multipart/form-data"> 
<table>
<tr><td>글쓴이 :</td><td><input type="text" name="name"></td></tr>
<tr><td>제목 : </td><td><input type="text" name="title"></td></tr>
<tr><td>파일 선택 : </td><td><input type="file" name="uploadFile"></td>
<tr><td colspan="2"><input type="submit" value="전송"></td></tr>
</table>
</form> 
<%@ include file="download.jsp" %>
</body>
</html>
