<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String code = request.getParameter("code");
    String viewPageURI = null;
    
    
    if(code.equals("A")){
    	viewPageURI = "/actionTag/forward/viewModule/a.jsp";
    }else if(code.equals("B")){
    	viewPageURI = "/actionTag/forward/viewModule/b.jsp";
    }else if(code.equals("C")){
    	viewPageURI = "/actionTag/forward/viewModule/c.jsp";
    }
    %>
    <jsp:forward page = "<%=viewPageURI %>"/>
    <!-- 처리할 수 있는 부분은 처리하로 
    자신이 처리 할 수 없는 부분은 다른 페이지에 바로 연결해주는 옵션키워드 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>