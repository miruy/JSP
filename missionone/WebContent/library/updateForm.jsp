<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.*"%>

<%
    int num = Integer.parseInt(request.getParameter("num"));
    request.setAttribute("num", num);
    
    String uploader = request.getParameter("uploader");
    request.setAttribute("uploader", uploader);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 수정</title>
</head>
<body>
<h3>업로드 파일 수정하기</h3>
	<form method="post" name="update" enctype="multipart/form-data"
	action="${pageContext.request.contextPath}/library/updateProc.jsp">
		
		<input type="hidden" name="num" value="${num }"/>
		${ldt.fileUpload }<br>
		<input type="file" name="fileUpload"><br>
		${param.uploader }<br>
		<input type="password" name="pass" placeholder="비밀번호(10자이내)"><br>
		<input type="text" name="content" placeholder="파일설명(100자이내)"><br>
		
		<input type="submit" value="수정"/>
		<input type="button" value="목록"
			onClick="document.location.href='${pageContext.request.contextPath }/library/list.jsp'"/>
	</form>	
</body>
</html>