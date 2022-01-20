<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, foodSurvey.*"%>
    <%
    FoodDAO foodDAO = FoodDAO.getInstance();
    ArrayList<FoodVO> result = foodDAO.selectAll();
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
<form method="post" action="registerProc.jsp">
	<%
	for(int i = 0; i < result.size(); i++){
	%>

	<input type="checkbox" name="food" value="kor"><%= result.get(i).getMenu() %> <br>
	
	<%} %>
	<input type="text" name="foodInput" placeholder="기타(직접입력)"><br><br>
	<input type="submit" value="투표">
</form>
<br>
<form method="post" action="main.jsp">
	<input type="submit" value="메인으로">
</form>
</body>
</html>