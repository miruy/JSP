<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>JSP_File</title>
</head>
<body>
	<h2>JSP script 예제</h2>
	<%
		//Scriptlet : 자바코드가 들어가는 곳 (연산,처리)

	String scriptlet = "스크립틀릿 입니다.";
	String comment = "주석문 입니다.";
	out.println("내장(기본)객체를 이용한 출력 : " + declation + "<br><br>");
	%>
	선언문 출력하기 :
	<%=declation%><br>
	<br> 선언문 출력하기 :
	<%=declationMethod()%><br>
	<br> 스크립틀릿 출력하기 :
	<%=scriptlet%><br>
	<br>
	<!-- JSP에서 사용하는 HTML주석문 -->
	<%-- JSP 주석 --%>
	<%-- <%=comment%> --%>
	<%
		//자바 주석
		/*
		자바 범위 주석
		*/
	%>

	
	<%!
	//declation : 선언문 
	String declation = "선언문 입니다.";
	/* - 선언문은 위치 상관없이 선언할 수 있고,변수 사용도 가능
	   - 필드(변수) 선언*/
	
	public String declationMethod(){
		//메서드(함수)선언 
		return declation;
	}
%>
</body>
</html>