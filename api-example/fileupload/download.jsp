<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%
	String savePath = "/fileupload/upload"; 
	ServletContext context = getServletContext(); 
	String uploadFilePath = context.getRealPath(savePath);
	File uploadDir = new File(uploadFilePath);
	String[] fileList = uploadDir.list();
%>
<h3>업로드 파일 목록</h3>
<ul>
<%	for(int i = 0; i < fileList.length; i++) { %>
	<li><a href="<%= request.getContextPath()%>/fileupload/upload/<%= fileList[i] %>" download><%= fileList[i] %></a></li>
<%	} %>
</ul>