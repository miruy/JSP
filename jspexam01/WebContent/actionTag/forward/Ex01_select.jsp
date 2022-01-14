<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옵션 선택 화면</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/actionTag/forward/Ex01_view.jsp">
		<!-- getContextPath() : 프로젝트의 이름이 바뀔 수도 있으니 프로젝트명을 쓰지 않고
		최상단 폴더라는 의미의 메서드 사용 -->
		보고 싶은 페이지 선택 : 
		<select name="code">
			<option value="A">A 페이지</option>
			<option value="B">B 페이지</option>
			<option value="C">C 페이지</option>
		</select>
		<input type="submit" value="이동">
	</form>
</body>
</html>