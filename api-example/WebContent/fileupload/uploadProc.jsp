<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String savePath = "/fileupload/upload";
	int uploadFileSizeLimit = 30 * 1024 * 1024;
	String encType = "UTF-8";
	String fileName = null;
	MultipartRequest multi = null;
	
	ServletContext context = getServletContext();
	String uploadFilePath = context.getRealPath(savePath);
	System.out.println("서버상의 실제 디렉터리");
	System.out.println(uploadFilePath);
	
	try {
		multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType,
		new DefaultFileRenamePolicy());
		fileName = multi.getFilesystemName("uploadFile");
	} catch (Exception e) {
		System.out.print("예외 발생 : " + e);
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드 처리</title>
</head>
<body>
<% if (fileName == null) { %>
	<h3>업로드 실패</h3>
<% } else { %>
	<br> 글쓴이 : <%= multi.getParameter("name") %>
	<br> 제목 : <%= multi.getParameter("title") %>
	<br> 파일명 : <%= fileName %>
<%	} %>
</body>
</html>
