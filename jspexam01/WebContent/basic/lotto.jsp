<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	<%@ page import="java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lotto 예상번호</title>
<style>
tr {
	valign: top;
}

td {
	border: 1px solid black;
	padding: 35px;
}
</style>
</head>
<body>
	<h1>로또 예상번호</h1>

		<table>
			<tr>
				<td>
					<%
					Random ran = new Random();
					int lotto[] = new int[6];
					for(int i = 0; i < lotto.length; i++){
					int num = (int)(Math.random() * 45) + 1;
					lotto[i] = num;
						for(int j = 0; j < i; j++){
							if(lotto[i] == lotto[j]){
								lotto[i] -= 1;
							 } 
					 	 } %>
					<table style="float: right">
						<tr>
							<td>
							 <%=lotto[i]%> 
							</td>
						</tr>
					</table>
					<% } %>
				</td>
			</tr>
		</table>

</body>
</html>