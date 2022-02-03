<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>begin, end 속성</title>
</head>
<body>
	<c:forEach var="cnt" begin="1" end="10" varStatus ="status">
		${cnt }
		<c:if test="${!status.last }">, </c:if>
	</c:forEach>
	<p>
	<table border="1" style="width: 100%; text-align : center;">
		<tr>
			<th>index</th>
			<th>count</th>
			<th>cnt</th>
		</tr>
		
		<c:forEach var="cnt" begin="7" end="10" varStatus="status">
			<tr>
				<td>${status.index }</td>
<!-- 				begin="7" end="10"이기때문에 데이터는 7 8 9 10만 출력되며
					인덱스 번호는 맨 위의 실행문으로 인해 차례대로 저장됨
  -->
				<td>${status.count }</td>
<!-- 				 	카운트 수는 항상 1부터 시작 -->
				<td>${cnt }</td>
<!-- 				begin="7" end="10"이기때문에 데이터는 7 8 9 10만 저장 -->
			</tr>	
		</c:forEach>	
	</table>
	<p>
	<table border="1" style="width : 100%; text-align : center;">
		<tr>
			<th>index</th>
			<th>count</th>
			<th>cnt</th>
		</tr>
		<c:forEach var="cnt" begin="1" end="10" varStatus="status" step="2">
<!-- 					step="2"로 인해 각 숫자가 2씩 건너뛰어 출력됨 -->
			<tr>
<!-- 			위와 같이 코드 해석-->
				<td>${status.index }</td>
				<td>${status.count }</td>
				<td>${cnt }</td>
			</tr>	
		</c:forEach>	
	</table>
</body>
</html>











