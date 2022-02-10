<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="refRoom.RefRoomDao" %> 

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="uploadfile" scope="page" class="refRoom.RefRoomDto">
	<jsp:setProperty name="uploadfile" property="*"/>
</jsp:useBean>

<%
	RefRoomDao dbPro = RefRoomDao.getInstance();
	dbPro.uploadFile(uploadfile);
	response.sendRedirect("list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileuploadProc</title>
</head>
<body>

</body>
</html>