<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
   	String searchPage = request.getParameter("searchPage");
    String view = null;
    
 	  if(searchPage.equals("구글")){
 	  view = %> <%= response.sendRedirect("https://www.google.com/")%>;
 	}else if(searchPage.equals("네이버")){  
 	  view = "https://www.naver.com/" ;
	}else if(searchPage.equals("다음")){ 
      view = "https://www.daum.net/" ;
	%>
	
	<jsp:forward page = "<%=view %>"/>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
 
</body>
</html>