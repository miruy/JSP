<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.LibraryDao" %>  
<%@ page import="library.LibraryDto" %>  
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	int count = 0;
	int number = 0;
	List<LibraryDto> articleList = null;
	LibraryDao dbPro = LibraryDao.getInstance();
	count = dbPro.getArticleCount();
	
	if(count > 0){
		articleList = dbPro.getArticles();
	}
	
	number = count;
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 목록</title>
</head>
<body>
<section>
	<h3>자료실</h3>
	<br>
	<article>
	<%
		if (count == 0) {
	%>
	<table>
		<tr>
			<td>자료실에 등록된 파일이 없습니다.</td>
		</tr>	
	</table>
	<%
		} else {
	%>
		<table>
			<tr>
				<th id="num">No.</th>
				<th id="content">File Description</th>
				<th id="filename">File Name</th>
				<th id="uploader">Up loader</th>
				<th id="readcount">Count</th>
			</tr>
	<%
		for(int i = 0; i < aricleList.size(); i++){
		LibraryDto article = (LibraryDto) articleList.get(i);
			}
	%>
			
	<%
		}
	%>			
		</table>
	</article>	
</section>
	
</body>
</html>















