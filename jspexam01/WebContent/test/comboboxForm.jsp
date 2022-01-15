<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콤보박스 입력 페이지</title>
</head>
<body>
<h2>검색 엔진을 선택하세요.</h2>
	<form method="post" action="comboboxResult.jsp">
	
	<select name="searchPage" id="searchPage" style="height: 30px; width: 50px">
	<option value="구글">구글</option>
	<option value="네이버">네이버</option>
	<option value="다음">다음</option>
	</select>
	<input type="submit" value="확인">
	</form>
</body>
</html>