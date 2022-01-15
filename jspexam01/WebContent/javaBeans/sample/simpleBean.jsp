<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	//String message = request.getParameter("message");
    %>
    <jsp:useBean id="msg" class="javaBeans.sample.SimpleData"/>
    <%--SimpleData msg = new SimpleData(); --%>
    <%--bean : 객체, <jsp:useBean>는 객체 생성 옵션(위 자바 코드와 같은 의미)--%>

	<jsp:setProperty name="msg" property="message"/>
	<%---msg.setMessage(세팅 값)와 같은 의미(setter) --%>
	
	<!-- 주의점 : 기본자료형, String -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beans 실습</title>
</head>
<body>
	<h1>간단한 빈즈 프로그램 결과</h1>
	<hr color="red"></hr><br><br>
	<font size="5">메세지 : <jsp:getProperty name="msg"
		property="message"/>
		<%-- <%=message%>와 같은 의미(getter, 값 출력) --%>
	</font>
</body>
</html>





