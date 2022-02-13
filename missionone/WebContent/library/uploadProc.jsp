<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="library.*" %> 
<%@ page import="java.io.*" %>


<%
	request.setCharacterEncoding("UTF-8");

	String savePath = "/library/upload";	//업로드된 파일이 저장될 위치
	int uploadFileSizeLimit = 10000 * 1024 * 1024;	//파일이 저장된 시간
	String encType = "UTF-8";	//인코딩 설정
	
	ServletContext context = getServletContext();	
	//하나의 서블릿이 서블릿컨테이너(서블릿을 관리해주는)와 통신하기 위한 메서드를 가지고 있는 클래스 
	
	String uploadFilePath = context.getRealPath(savePath);	//서버상의 파일이 업로드되는 경로 
	
	//java.lang.IllegalArgumentException: Not a directory 에러 발생 후 추가함
	File f = new File(uploadFilePath);	//파일이 없다면 파일 생성
	if(!f.exists()){
		f.mkdirs();
	}
	//-------------------------------------------------------------------
	
	MultipartRequest multi = new MultipartRequest(	/*파일업로드 클래스 */
			request, uploadFilePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());	
	//요청객체, 서버상의 파일 저장위치, 파일이 저장된 시간, 인코딩 타입, 파일의 이름이 같으면 뒤에 숫자를 붙혀 구별해주는 생성자
	//를(5가지) 매개변수로 넣어 파일업로드 객체 생성 
	
	
	//사용자가 업로드하는 파일객체의 각 데이터(사용자가 input칸에 입력하여 DB에 저장된)를 가져와 dto객체에 저장 
	LibraryDto ldt = new LibraryDto();

	ldt.setFileUpload(multi.getFilesystemName("fileUpload"));
	ldt.setUploader(multi.getParameter("uploader"));
	ldt.setPass(multi.getParameter("pass"));
	ldt.setContent(multi.getParameter("content"));
	
	//dto객체에 저장한 데이터를 dao에 정의한 insert메서드로 db에 넣기 
	LibraryDao ldo = LibraryDao.getInstance();
	int check = ldo.upload(ldt);
	request.setAttribute("check", check);
%>	

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileuploadProc</title>
</head>
<body>
	<c:if test="${check != 1}">
		<c:out value="파일 업로드 실패!"/>
		<a href="javascript:history.go(-1)">[이전으로 돌아가기]</a>
	</c:if>
	<c:if test="${check == 1}">
		<c:redirect url="list.jsp"></c:redirect> 
	</c:if>
</body>
</html>










