package servletex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/hello")
public class HelloServlet extends HttpServlet{

	@Override
	protected void doGet(
			HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset = utf-8" ); 
		
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		
		out.println("<html>");
		out.println("<head><title>인사 서블릿</title></head>");
		out.println("<body>");
		out.print("안녕하세요. " + name + "님 :)");
		out.println("</body></html>");
	}
	
	
}
