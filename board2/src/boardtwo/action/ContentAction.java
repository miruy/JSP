package boardtwo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardtwo.model.BoardDao;
import boardtwo.model.BoardDto;

public class ContentAction implements CommandAction{
//	글 내용을 처리 
	public String requestPro(
			HttpServletRequest request,
            HttpServletResponse response)throws Throwable{
		
//		해당 글번호 
		int num = Integer.parseInt(request.getParameter("num"));
		
//		해당 페이지 번호 
		String pageNum = request.getParameter("pageNum");
		BoardDao dbPro = BoardDao.getInstance();
			
//		해당 글번호에 대한 레코드 
		BoardDto article = dbPro.getArticle(num);
		
//		뷰에서 사용할 속성 
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("article", article);
		return "/boardtwo/content.jsp";	//요청에 응답할 뷰 경로 
		}
	
}








