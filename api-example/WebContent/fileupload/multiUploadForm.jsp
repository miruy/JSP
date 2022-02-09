<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다중 파일 업로드</title>
</head>
<body>
<h3>다중 파일 업로드</h3>
<form action="multiUploadProc.jsp" method="post" enctype="multipart/form-data"> 
<table>
<tr><td>파일 지정 : </td><td><input type="file" name="uploadFile01"></td></tr> 
<tr><td>파일 지정 : </td><td><input type="file" name="uploadFile02"></td></tr>
<tr><td>파일 지정 : </td><td><input type="file" name="uploadFile03"></td></tr> 
<tr><td colspan="2"><input type="submit" value="전송"></td></tr> 
</table>
</form>
<%@ include file="download.jsp" %>
</body>
</html>
