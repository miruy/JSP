<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="library.*"%>
<%@ page import="java.io.*"%>


<%
	request.setCharacterEncoding("UTF-8");

	String savePath = "/library/upload";
	int uploadFileSizeLimit = 5 * 1024 * 1024;
	String encType = "UTF-8";
	ServletContext context = getServletContext();
	String uploadFilePath = context.getRealPath(savePath);
	
	File f = new File(uploadFilePath);	//파일이 없다면 파일 생성
	if(!f.exists()){
		f.mkdirs();
	}
	
	MultipartRequest multi = new MultipartRequest(	/*파일업로드 클래스 */
			request, uploadFilePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
	
	int num = Integer.parseInt(multi.getParameter("num"));
	request.setAttribute("num", num);
	
	LibraryDao ldo = LibraryDao.getInstance();
	LibraryDto ldt = ldo.getContent(num);
	request.setAttribute("ldt", ldt);
	
	String updateFile = ldt.getFileUpload();
	String updateFilePath = uploadFilePath + "/" + updateFile;
	
	LibraryDto ldt2 = new LibraryDto();
	ldt2.setFileUpload(multi.getFilesystemName("fileUpload"));
	ldt2.setUploader(multi.getParameter("uploader"));
	ldt2.setPass(multi.getParameter("pass"));
	ldt2.setContent(multi.getParameter("content"));
	
	int check = ldo.update(ldt2, updateFilePath);
	request.setAttribute("check", check);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filupdateProc</title>
</head>
<body>
	<c:if test="${check != 1}">
		<c:out value="파일 업데이트 실패!" />
		<a href="javascript:history.go(-1)">[이전으로 돌아가기]</a>
	</c:if>
	<c:if test="${check == 1}">
		<c:redirect url="content.jsp?num=${num }"></c:redirect>
	</c:if>	
</body>
</html>