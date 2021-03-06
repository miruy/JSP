package boardtwo.action;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import java.sql.Timestamp;
 
import boardtwo.model.BoardDao;
import boardtwo.model.BoardDto;
 
public class WriteProAction implements CommandAction{
 
    public String requestPro(
            HttpServletRequest request, 
            HttpServletResponse response) throws Throwable {
        request.setCharacterEncoding("UTF-8");
        BoardDto article = new BoardDto();    //데이터를 처리할 빈
        article.setNum(Integer.parseInt(request.getParameter("num")));
        article.setWriter(request.getParameter("writer"));
        article.setEmail(request.getParameter("email"));
        article.setSubject(request.getParameter("subject"));
        article.setPass(request.getParameter("pass"));
        article.setRegdate(new Timestamp(System.currentTimeMillis()));
        article.setRef(Integer.parseInt(request.getParameter("ref")));
        article.setStep(Integer.parseInt(request.getParameter("step")));
        article.setDepth(Integer.parseInt(request.getParameter("depth")));
        article.setContent(request.getParameter("content"));
        article.setIp(request.getRemoteAddr());
 
        BoardDao dbPro = BoardDao.getInstance(); //DB 연결
        dbPro.insertArticle(article);
        return "/boardtwo/writePro.jsp";    //해당 뷰 경로 반환
    }
}

