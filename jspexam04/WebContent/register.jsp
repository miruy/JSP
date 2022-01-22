<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, foodSurvey.*"%>
<%
FoodDAO foodDAO = FoodDAO.getInstance();
List<FoodVO> result = foodDAO.selectAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 참여</title>
</head>
<body>
	<h2>좋아하는 음식 종류 설문조사</h2>

	<h3>설문하기</h3>
	<form method="post" action="registerProc.jsp" name="register">
		<%
		for (int i = 0; i < result.size(); i++) {
		%>
		<input type="radio" name="food" value="<%=result.get(i).getMenu()%>">
		<%=result.get(i).getMenu()%>
		<br>
		<%
		}
		%>
		<input type="text" name="foodInput" placeholder="기타(직접입력)"><br>
		<br> <input type="submit" value="투표">
	</form>

	<button type="button" onclick="location.href='main.jsp';">메인으로</button>

</body>
</html>