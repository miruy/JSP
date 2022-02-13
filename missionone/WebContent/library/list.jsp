<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="library.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	int fileCount = 0;
	List<LibraryDto> fileList = null;
	LibraryDao dbPro = LibraryDao.getInstance();
	fileCount = dbPro.getFileCount();
// 	System.out.println(fileCount);

		fileList = dbPro.getFileList();
		request.setAttribute("fileCount", fileCount);
		request.setAttribute("fileList", fileList);
	
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 목록</title>
</head>
<body>
<section>
	<h2>자료실</h2>
	<br>
	
	<c:if test="${fileCount > 0 }">
		<table border="1">
			<tr>
				<th id="num">No.</th>
				<th id="fileUpload">File Name</th>
				<th id="uploader">UpLoader</th>
				<th id="content">File Description</th>
				<th id="readcount">Count</th>
			</tr>		
			
			<c:forEach var="file" items="${fileList }">		
			<tr>
				<td><c:out value="${file.num }"/></td>
				<td>
					<a href="${pageContext.request.contextPath }/library/content.jsp?num=${file.num }">
						${file.fileUpload }</a>
				</td>		
				<td><c:out value="${file.uploader }"/></td>
				<td><c:out value="${file.content }"/></td>	
				<td><c:out value="${file.readcount }"/></td>
			</tr>
			</c:forEach>
		</table><br>
		<input type="button" value="파일 올리기"
					onClick="document.location.href='${pageContext.request.contextPath }/library/uploadForm.jsp'">
	</c:if>

	<c:if test="${fileCount == 0 }">
			자료실에 등록된 파일이 없습니다.
			<input type="button" value="파일 올리기"
					onClick="document.location.href='${pageContext.request.contextPath }/library/uploadForm.jsp'">
	</c:if>	
</section>
	
</body>
</html>















