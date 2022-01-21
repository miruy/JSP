<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="foodSurvey.*"%>
    <%
    request.setCharacterEncoding("UTF-8");
    String food = request.getParameter("food");
    String foodInput = request.getParameter("foodInput");
    
	if(!foodInput.equals("")){
		
	    FoodDAO foodDao = FoodDAO.getInstance();
	    FoodVO fv = new FoodVO();
	    fv.setMenu(foodInput);
	    fv.setVote(1);
	    foodDao.insert(fv);
	 %> 
	 <script>
	  alert(<%=foodInput%> + "에 투표하였습니다.");
	 </script> 
	 
	 <%    	
	}else if(food != null){
		out.print(food);
	 %>
	
	<%    
	}else if(foodInput == null && food == null){ 
	%>
	<script>
	  alert("투표할 메뉴를 선택하세요.");
	</script> 
	
    <%
    }else if(foodInput != null && food != null){
    %>
    <script>
	  alert("투표할 메뉴를 하나만 선택하세요.");
	</script>
    <% 	
    }
	%>