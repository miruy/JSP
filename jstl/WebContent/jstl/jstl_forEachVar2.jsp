<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first, last 프로퍼티</title>
</head>
<body>
	<%
		String[] movieList = {"타이타닉", "시네마 천국", "혹성 탈출", "킹콩"};
		pageContext.setAttribute("movieList", movieList);
	%>
	<ul>
		<c:forEach var="movie" items="${movieList }" varStatus="status">
			<c:choose>
				<c:when test="${status.first }">
<!-- 				코드 해석 : 데이터의 첫번째일 경우 폰트 속성을 적용해라 -->
					<li style="font-weight : bold; color : red;">
					${movie }
					</li>
				</c:when>
				<c:otherwise>
					<li>${movie }</li>
				</c:otherwise>	
			</c:choose>	
		</c:forEach>	
	</ul>
	
	<c:forEach var="movie" items="${movieList }" varStatus="status">
		${movie }
			<c:if test="${!status.last }"> , </c:if>
<!-- 		코드	해석 : 마지막 데이터가 아니라면 , 를 찍어라 -->
	</c:forEach>
</body>
</html>










