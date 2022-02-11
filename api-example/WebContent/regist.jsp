<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>회원가입</p>
<form action="${pageContext.request.contextPath}/regist" method="post">
<input type="text" id="id" name="id" placeholder="아이디" required>
<input type="button" id="idCheck" value="중복체크" onclick="idCheck()"><span id="idCheckResult"></span><br>
<input type="text" name="pw1" placeholder="비밀번호" required><br>
<input type="text" name="pw2" placeholder="비밀번호 확인" required><br>
<input type="submit" value="로그인">
</form>

<script>
(function() {
	  var httpRequest;
	  document.getElementById("idCheck").addEventListener('click', makeRequest);

	  function makeRequest() {
	    httpRequest = new XMLHttpRequest();

	    if(!httpRequest) {
	      alert('XMLHTTP 인스턴스를 만들 수가 없어요 ㅠㅠ');
	      return false;
	    }
	    httpRequest.onreadystatechange = alertContents;
		//GET으로 요청
	    //httpRequest.open('GET', "${pageContext.request.contextPath}/idCheck?id="+document.getElementById("id"));
	    //httpRequest.send();

	    //POST로 요청
	    httpRequest.open('POST', "${pageContext.request.contextPath}/idCheck");
	    httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	    httpRequest.send('id=' + encodeURIComponent(document.getElementById("id").value));
	  }

	  function alertContents() {
	    if (httpRequest.readyState === XMLHttpRequest.DONE) {
	      if (httpRequest.status === 200) {
	    	document.getElementById("idCheckResult").innerHTML = httpRequest.responseText;
	      } else {
	        alert('request에 뭔가 문제가 있어요.');
	      }
	    }
	  }
	})();
</script>
</body>
</html>