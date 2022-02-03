<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="foodSurvey.*"%>
    <%
    request.setCharacterEncoding("UTF-8");
    FoodDAO foodDao = FoodDAO.getInstance();
    String food = request.getParameter("food");
    String foodInput = request.getParameter("foodInput");
	
    
	 if(!foodInput.equals("") && food != null){
		out.print("투표할 메뉴를 하나만 선택하세요.");
	 }else if(foodInput.equals("") && food == null){
		 out.print("투표할 메뉴를 선택하세요.");
	 }else if(food != null){
		 foodDao.update(food);
		 out.print("["+ food +"] 에 투표하였습니다.");
	 }else if(!foodInput.equals("")){
		    FoodVO fv = new FoodVO();
		    fv.setMenu(foodInput);
		    fv.setVote(1);
		    foodDao.insert(fv);
		    out.print("["+ foodInput +"] 에 투표하였습니다.");
	 }
	 %>
	 <br><br>
		<button type="button" onclick="location.href='main.jsp';">메인으로</button>