<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Enumeration"%>
    <%
    request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
</head>
<body>
<h3>입력하신 정보는 아래와 같습니다.</h3><br>

학력 : <%=request.getParameter("edu") %><br>

소속 국가 : <%=request.getParameter("nation") %><br>

관심 분야 : 
	<% 
		String[] values = request.getParameterValues("liked");
		if(values != null){
			for(int i = 0 ; i < values.length; i++ ){
	%>
		<%=values[i] %>
	   <%} 
	  	} %><br>
	  	
</body>
</html>