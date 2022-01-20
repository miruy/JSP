<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="foodSurvey.*"%>
    <%
    request.setCharacterEncoding("UTF-8");
//     String[] food = request.getParameterValues("food");
    String foodInput = request.getParameter("foodInput");
    
	if(foodInput != null){
	    FoodDAO foodDao = FoodDAO.getInstance();
	    FoodVO fv = new FoodVO();
	    fv.setMenu(foodInput);
	    fv.setVote(1);
	    foodDao.insert(fv);
	}
//     for(int i = 0; i < menus.length; i++){
//     	System.out.println(menus[i]);
//     }
    
//     System.out.println(menu);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerProc</title>
</head>
<body>
	<%=foodInput %>에 투표하였습니다.
</body>
</html>