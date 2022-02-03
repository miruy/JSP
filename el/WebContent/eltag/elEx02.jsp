<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="eltag.Customer, java.util.ArrayList" %>
<!-- 표현언어로 배열사용하기 -->
<%
	ArrayList<String> singer = new ArrayList<String>();
	singer.add("에이핑크");
	singer.add("여자친구");
	request.setAttribute("singer", singer);
	
	Customer[] customer = new Customer[2];
	customer[0] = new Customer();
	customer[0].setName("홍길동");
	customer[0].setEmail("hong@naver.com");
	customer[0].setPhone("010-1234-1234");
	
	customer[1] = new Customer();
	customer[1].setName("이순신");
	customer[1].setEmail("shin@naver.com");
	customer[1].setPhone("010-5678-5678");
	request.setAttribute("customer", customer);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Example</title>
</head>
<body>
	<ul>
		<li>${singer[0]}, ${singer[1]}</li>
	</ul>
	<ul>
		<li>이름 : ${customer[0].name }</li>
		<li>메일 : ${customer[0].email }</li>
		<li>전화 : ${customer[0].phone }</li>
	</ul>
	<ul>
		<li>이름 : ${customer[1].name }</li>
		<li>메일 : ${customer[1].email }</li>
		<li>전화 : ${customer[1].phone }</li>
	</ul>
	
</body>
</html>