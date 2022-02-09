package sample.img;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/imgDetail")
public class ImageFileDetailSample extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//"file:///C:/dev/springtest/work/api-example/WebContent/Doraemon.png"
		String path = req.getServletContext().getRealPath("/images");
		String fileName = req.getParameter("fileName");
		File img = new File(path, fileName);
		String name = img.getName();
		Date d = new Date(img.lastModified());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String lastModified = format.format(d);
		System.out.println("파일명:" + name);
		System.out.println("수정시간:" + lastModified);
		System.out.println("크기:" + img.length());
		req.setAttribute("name", name);
		req.setAttribute("lastModified", lastModified);
		req.setAttribute("length", img.length());
		req.getRequestDispatcher("imageDetail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
