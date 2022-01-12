<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%! //declation 선언부
	private int numOne = 0;
	//tomcat이 서버를 실행할때 생기는 객체
	public void jspInit() {	//오버라이딩 
		System.out.println("jspInit() 호출됨!");
	}

	public void jspDestroy() {	//오버라이딩 
		System.out.println("jspDestroy() 호출됨!");
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life Cycle</title>
</head>
<body>	
<% //스크립틀릿 
	int numTwo = 0;	//스크립클립 안에 선언된 변수는 지역변수 
	numOne++;	//새로고침 시 마다 증가
	numTwo++;	//새로고침 시 마다 초기화
%>
<ul>
	<li>Number One : <%=numOne %></li>
	<li>Number Two : <%=numTwo %></li>
</ul>
</body>
</html>







