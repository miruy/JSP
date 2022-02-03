<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardone.BoardDao" %> 
<%@ page import="boardone.BoardDto" %> 
<%@ page import="java.text.SimpleDateFormat" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link href="css/contentstyle.css" rel="stylesheet" type="text/css"/>
</head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	try{
		BoardDao dbPro = BoardDao.getInstance();
		BoardDto article = dbPro.getArticle(num);
		int ref = article.getRef();
		int step = article.getStep();
		int depth = article.getDepth();
%>
<body>
	<section>
		<article>
			<b>글 내용 보기</b>
				<form>
					<table class="contenttable">
						<tr>
							<th>글 번호</th>
								<td><%=article.getNum() %></td>
							<th>조회 수</th>
								<td><%=article.getReadcount() %></td>
						</tr>
							
						<tr>
							<th>작성자</th>
								<td><%=article.getWriter() %></td>
							<th>작성일</th>
								<td><%=article.getRegdate() %></td>
						</tr>
							
						<tr>
							<th>글 제목</th>
								<td colspan="3" class="contenttitle"><%=article.getSubject() %></td>
						</tr>
						
						<tr>
							<th>글 내용</th>
								<td colspan="3" class="content"><pre><%=article.getContent() %></pre></td>
						</tr>		
								
						<tr>
							<td colspan="4">
							 	<input type="button" value="글 수정"
							 	onClick="document.location.href=
							 	'updateForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">
							 		&nbsp;&nbsp;&nbsp;&nbsp;
							 	<input type="button" value="글 삭제"
							 	onClick="document.location.href=
							 	'deleteForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">
							 		&nbsp;&nbsp;&nbsp;&nbsp;
							 <!-- 수정 1 -->	
							 <input type="button" value="답글"
							 onClick="document.location.href=
								 'writeForm.jsp?num=<%=num %>&ref=<%=ref %>&step=<%=step %>&depth=<%=depth %>'">
							 
							 
							 	<input type="button" value="글 목록"
							 	onClick="document.location.href=
							 	'list.jsp?pageNum=<%=pageNum%>'">
							 </td>
						</tr>		 
					</table>
					<%}catch(Exception e){} %>
				</form>
		</article>
	</section>
</body>
</html>

















