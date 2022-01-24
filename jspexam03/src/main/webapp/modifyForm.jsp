<!-- 정보수정 폼 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="memberone.*" %>
<jsp:useBean id="dao" class="memberone.MemberDao"/>
<%
	String loginID = (String)session.getAttribute("loginID");
	MemberDto dto = dao.getMember(loginID);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Form</title>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link href="css/regFormstyle.css" rel="stylesheet" type="text/css"/>
<script src="script.js"></script>
</head>
<body>
<section>
<form method="post" action="modifyProc.jsp" name="regForm">
<table class="regtable">
	<tr>
		<th colspan="2">회원 수정 정보 입력</th>
	</tr>
	<tr>
		<td>아이디 : </td>
		<td><%=dto.getId() %></td>
	</tr>
	<tr>
		<td>패스워드 : </td>
		<td><input type="password" name="pass" value="<%=dto.getPass() %>"required/></td>
	</tr>	
	<tr>
		<td>패스워드 확인 : </td>
		<td><input type="password" name="repass" value="<%=dto.getPass() %>"required/></td>
	</tr>
	<tr>
		<td>이메일 : </td>
		<td><input type="email" name="email" value="<%=dto.getEmail() %>"required/></td>
	</tr>
	<tr>
		<td colspan="2" class="regsubmit">
		<input type="button" value="정보 수정" onclick="updateCheck()"/>
		<input type="button" value="취소" onclick="javascript:window.location='main.jsp'"/>
		</td>
	</tr>
</table>
</form>
</section>
</body>
</html>
