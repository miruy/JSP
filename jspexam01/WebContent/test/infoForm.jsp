<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 양식 페이지</title>
</head>
<body>
	<form action="infoResult.jsp" method="post">
		ID : <input type="text" name="ID"><br> 
		Password : <input type="text" name="Password"><br> 
		
		
     	자기소개<br> 
     	 <textarea cols="50" rows="10" name="자기소개"></textarea><br>
     	 
       	 <input type="submit" value="전송">
		 <input type="reset" name="초기화">
		
	</form>
</body>
</html>