<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> 
<%@ page import="java.io.*" %>
<%@ page import="library.LibraryDto" %> 

<%
	request.setCharacterEncoding("UTF-8");
	String savePath = "/library/upload";	//업로드된 파일이 저장될 위치
	int uploadFileSizeLimit = 5 * 1024 * 1024;	//파일이 저장된 시간
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
	//매개변수로 요청객체, 서버상의 파일 저장위치, 파일이 저장된 시간, 인코딩 타입, 파일의 이름이 같으면 뒤에 숫자를 붙혀 구별해주는 생성자
	//를(5가지) 매개변수로 넣어 파일업로드 객체 생성 
	
	String upLoader = multi.getParameter("upLoader");
	String pass = multi.getParameter("pass");
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	
	LibraryDto ld = new LibraryDto();
	ld.setUpLoader(upLoader);
	ld.setPass(pass);
	ld.setSubject(subject);
	ld.setContent(content);
	
%>	
	
<!-- // 	 String name=mr.getParameter("name"); // 업로드시에만 사용 -->
<!-- //      String subject=mr.getParameter("subject"); -->
<!-- //      String content=mr.getParameter("content"); -->
<!-- //      String pwd=mr.getParameter("pwd"); -->
     
<!-- //      // 받은 데이터들을 DAO => DAO에서 오라클에 INSERT -->
<!-- //      DataBoardVO vo=new DataBoardVO(); -->
<!-- //      vo.setName(name); -->
<!-- //      vo.setSubject(subject); -->
<!-- //      vo.setContent(content); -->
<!-- //      vo.setPwd(pwd); -->
	
	
	
	
<%
	String fileName = multi.getFilesystemName("uploadFile");
	//파일업로드 객체가 가지고 있는 '이름을 가져오는 메서드'를 이용하여 
	//그의 파라미터로 uploadForm.jsp에서 지정한 파일이름을 넣어 변수에 담음 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileuploadProc</title>
</head>
<body>
	<c:if test="${fileName == null }">
		<c:out value="파일 업로드 실패!"/>
	</c:if>
	<c:if test="${fileName != null }">
		<c:redirect url="list.jsp"></c:redirect> 
	</c:if>
</body>
</html>










