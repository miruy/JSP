package sample.regist;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/regist")
public class RegistServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("회원가입 요청");
		System.out.println("/regist.jsp");
		req.getRequestDispatcher("/regist.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pw1 = req.getParameter("pw1");
		String pw2 = req.getParameter("pw2");
		
		if(pw1.equals(pw2)) {
			System.out.println("가입정보");
			System.out.println("ID:" + id);
			System.out.println("PW:" + pw1);
			req.getRequestDispatcher(req.getContextPath() + "/registSuccess.jsp");
		}else {
			req.getRequestDispatcher(req.getContextPath() + "/regist.jsp");
		}
	}
}
