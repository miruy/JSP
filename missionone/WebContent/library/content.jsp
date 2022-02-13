<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.*" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<%
request.setCharacterEncoding("UTF-8");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 정보</title>
</head>
<body>
<h3>업로드 파일정보</h3>
<br>
	
	<table border="1">
		<tr> <!-- 표의 첫번째 가로 (헤더) -->
			<th>No.</th>
			<th>UpLoader</th>
			<th>Count</th>
		</tr>
		
		<tr> <!-- 표의 두번째 가로 (데이터)-->
			<td>${ldt.num }</td>
			<td>${ldt.uploader }</td>
			<td>${ldt.readCount }</td>
		</tr>	
		
		<tr> <!-- 표의 세번째 가로 (데이터)-->
			<td>설명</td>
			<td colspan="2">${ldt.content }</td>
		</tr>
		
		<tr> <!-- 표의 세번째 가로(데이터) -->
			<td>File</td>
			<td colspan="2">
				<a href="${ldt.fileUpload }" download="${ldt.fileUpload }"></a>
			${ldt.fileUpload }
			</td>
		</tr>
	</table>

</body>
</html>