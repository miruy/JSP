package boardtwo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardtwo.model.BoardDao;
import boardtwo.model.BoardDto;

public class DeleteFormAction implements CommandAction{
	public String requestPro(
			HttpServletRequest request,
            HttpServletResponse response)throws Throwable{
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		System.out.println(pageNum);
			
//		뷰에서 사용할 속성 
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		
		return "/boardtwo/deleteForm.jsp";	//처리할 뷰 경로
	}
}
