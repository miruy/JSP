<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Enumeration"
	import="java.util.Map"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 양식 페이지</title>
</head>
<body>
<form action="selectResult.jsp" method="post">
	<p>학력<br>
	<select name="학력" style="height: 30px; width: 60px">
		<option value="">재학생</option>
		<option value="">졸업생</option>
	</select></p>

	<p>소속 국가<br>
	<select name="소속 국가" style="height: 30px; width: 70px">
		<option value="">대한민국</option>
		<option value="">미국</option>
		<option value="">일본</option>
	</select></p>
	
	<p>관심 분야<br>
	<select name="학력" style="height: 60px; width: 80px" multiple="multiple">
		<option value="">컨설팅</option>
		<option value="">프로듀서</option>
		<option value="">프로그래머</option>
		<option value="">서버관리자</option>
	</select></p>
	
	<input type="submit" value="전송">
	<input type="reset" name="초기화">
</form>
</body>
</html>