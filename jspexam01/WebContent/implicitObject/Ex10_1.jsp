<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    pageContext.setAttribute("name", "page man");
    request.setAttribute("name", "request man");
    session.setAttribute("name", "session man");
    application.setAttribute("name", "application man");
    System.out.println("firstPage.jsp : ");
    System.out.println("하나의 페이지 속성 : " + pageContext.getAttribute("name"));
    System.out.println("하나의 요청 속성 : " + request.getAttribute("name"));
    System.out.println("하나의 세션 속성 : " + session.getAttribute("name"));
    System.out.println("하나의 애플리케이션 속성 : " + application.getAttribute("name"));
    request.getRequestDispatcher("Ex10_2.jsp").forward(request, response);
    %>
    <!-- pageContext, request, session, application객체에 새로운 속성을 추가한 후 
    secondPage.jsp로 포워딩한다.
    이 페이지에서 설정한 속성 값은 브라우저에 출력 할 수 없기 때문에 4개의 값이 콘솔 창에 출력된다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>