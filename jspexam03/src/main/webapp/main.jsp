
<!--로그인 폼_-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String loginID = (String)session.getAttribute("loginID"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="Text/html; charset=UTF-8">
<title>Login</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/mainstyle.css" rel="stylesheet" type="text/css">
</head>
<body>
	<section>
		<article class="logininfo">
		<%if(loginID != null) {%>
		<table>
			<tr><td colspan="3"><%=loginID %>님 환영합니다.</td></tr>
			<tr>
			<td class="infomenu"><a href="modifyForm.jsp">정보수정</a></td>
			<td class="infomenu"><a href="deleteForm.jsp">회원탈퇴</a></td>
			<td class="infomenu"><a href="logoutForm.jsp">로그아웃</a></td>
			</tr>
		</table>
		<% }else{ %>
			<script>
			alert("정상적인 접근이 아닙니다. 로그인 해주세요.");
			location.href="login.jsp";
			</script>
		<%} %>
		</article>
	</section>
</body>
</html>









