package sample.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/login1")
public class LoginServlet1 extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/login1.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");		
		if(id.equals(pw)) {
			req.getSession().setAttribute("id", id);
			System.out.println("로그인 성공!");
		}else {
			System.out.println("로그인 실패!");
		}
		resp.sendRedirect(req.getContextPath()+"/loginSuccess.jsp");
	}
}
