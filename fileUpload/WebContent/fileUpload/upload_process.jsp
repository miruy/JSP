<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> 
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String savePath = "/fileUpload/upload";	//파일이 저장될 경로(서버 측)
		int uploadFileSizeLimit = 5 * 1024 * 1024;	//파일이 업로드 되는 시간을 정해놓는 코드
		String encType = "UTF-8";
		
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);	//RealPath : 실제 서비스할 파일이 어디에있는지 찾아오는 메서드
		System.out.println("서버상의 실제 디렉터리");
		System.out.println(uploadFilePath);
		
		//폴더가 없으면 생성!
		File f = new File(uploadFilePath);
		if(!f.exists()){
			f.mkdirs();
		}
		
		try{
			MultipartRequest multi = new MultipartRequest(
					request,	//이 request 객체에 바운더리로 구분된 데이터가 들어있음
					uploadFilePath,	//파일이 들어오면 이 변수로 지정된 경로로 저장됨
					uploadFileSizeLimit,	//저장된 시간
					encType,	//한글이 깨지지 않도록 세팅하여 저장하는 변수
					new DefaultFileRenamePolicy());	//이름이 똑같은 파일이 있을 경우 이름이 겹치지 않도록 바꾸는 클래스(생성자)
					//위에 생성자가 없으면 같은 이름의 파일이 있을 경우 파일을 새로 만들지 않고 덮어씌움
			String fileName = multi.getFilesystemName("uploadFile"); //파일명을 가져오는 코드 
			if(fileName == null){
				System.out.print("파일 업로드 실패");
			}
			else{
				out.println("<br>글쓴이 : " + multi.getParameter("name"));
				out.println("<br>제 &nbsp; 목 : " + multi.getParameter("title"));
				out.println("<br>파일명 : " + fileName);
			}
		}catch(Exception e){
			System.out.print("예외 발생 : " + e);
			e.printStackTrace();
		}
	%>
</body>
</html>












