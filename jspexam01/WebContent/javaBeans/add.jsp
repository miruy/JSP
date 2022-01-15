<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javaBeans.sample.Customer" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="customer" class="javaBeans.sample.Customer" scope="page"/>
	<jsp:setProperty property="*" name="customer"/>
	<!-- property="*" : 저장된 모든 객체 정보 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer 가입 정보</title>
</head>
<body>
	<ul>
		<li>이름 : <jsp:getProperty property="name" name="customer"/>
		<li>이메일 : <jsp:getProperty property="email" name="customer" />
		<li>전화번호 : <jsp:getProperty property="phone" name="customer" /> 
	</ul>
</body>
</html>