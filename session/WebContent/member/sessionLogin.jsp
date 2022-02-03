<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    
    boolean flag = id.equals(password);
    if(flag == true){
    	session.setAttribute("MEMBERID", id);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
	로그인 성공
</body>
</html>     
	<%
    }else if( flag == false ){ //로그인 실패
	%>
	<script>
	alert("로그인에 실패하였습니다.");
	history.go(-1);
	</script>
	<%
	}
	%>