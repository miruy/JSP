<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%
	Map<String,Cookie> cookieMap = new HashMap<String,Cookie>();
	boolean login = false;
	if(request.getCookies() != null){
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(int i = 0; i < cookies.length; i++){
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
			Cookie tmp = cookieMap.get("LOGIN");
			if(tmp != null)
				login = tmp.getValue().equals("SUCCESS");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인여부 검사</title>
</head>
<body>
<%
	if(login){
%>
아이디 ["<%=cookieMap.get("ID").getValue() %>"]로 로그인 한 상태 
<%
	}else{
%>
로그인 하지 않은 상태 
<%
	}
%>
</body>
</html>








