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
<title>설문 현황</title>
</head>
<body>
<h2>좋아하는 음식 종류 설문조사</h2>
<h3>설문 현황보기</h3>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>음식</th>
			<th>투표 수</th>
		</tr>
			<%
			for(int i = 0; i < result.size(); i++){
			%>
		<tr>
			<td><%=result.get(i).getNum() %></td>
			<td><%=result.get(i).getMenu() %></td>
			<td><%=result.get(i).getVote() %></td>
		<tr>	
			<% } %>
	</table>
	
	<br><button type="button" onclick="location.href='main.jsp';">메인으로</button>
</body>
</html>