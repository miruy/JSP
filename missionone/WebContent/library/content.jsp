<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.*" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<%
	request.setCharacterEncoding("UTF-8");
	
	//사용자가 선택한 file의 번호를 가져와 num변수에 저장
	//(값이 넘어올때 String으로 넘어오므로 Integer.parsInt()를 이용하여 정수로 변환)
	int num = Integer.parseInt(request.getParameter("num"));
	
	LibraryDao ldo = LibraryDao.getInstance();
	LibraryDto ldt = ldo.getContent(num);
	ldo.readCountUp(num);
	
	request.setAttribute("ldt", ldt);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 정보</title>
</head>
<body>
<h3>업로드 파일정보</h3>
<br>
	
	<table border="1">
		<tr> <!-- 표의 첫번째 가로 (헤더) -->
			<th>No.</th>
			<th>UpLoader</th>
			<th>Count</th>
		</tr>
		
		<tr> <!-- 표의 두번째 가로 (데이터)-->
			<td>${ldt.num }</td>
			<td>${ldt.uploader }</td>
			<td>${ldt.readcount }</td>
		</tr>	
		
		<tr> <!-- 표의 세번째 가로 (데이터)-->
			<td>설명</td>
			<td colspan="2">${ldt.content }</td>
		</tr>
		
		<tr> <!-- 표의 세번째 가로(데이터) -->
			<td>File</td>
			<td colspan="2">
			<a href="${pageContext.request.contextPath }/library/upload/${ldt.fileUpload }" 
				download="${ldt.fileUpload }">${ldt.fileUpload }</a>
			</td>
		</tr>
		
		<tr>
			<td colspan="3">
				<input type="button" value="수정" 
						onClick="document.location.href='${pageContext.request.contextPath }/library/updateForm.jsp?num=${ldt.num }'">
				<input type="button" value="삭제" 
						onClick="document.location.href='${pageContext.request.contextPath }/library/deleteForm.jsp?num=${ldt.num }'">
				<input type="button" value="목록" 
						onClick="document.location.href='${pageContext.request.contextPath }/library/list.jsp'">		
			</td>
		</tr>
	</table>

</body>
</html>