package sample.img;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

@WebServlet(urlPatterns = "/img")
public class ImageFileSample extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//"file:///C:/dev/springtest/work/api-example/WebContent/Doraemon.png"
		String path = req.getServletContext().getRealPath("/images");
		String fileName = req.getParameter("fileName");
		File img = new File(path, fileName);
		System.out.println(img.getAbsolutePath());
		if(img.exists()) {
			resp.setContentType("image/jpeg");
			byte[] image = IOUtils.toByteArray(new FileInputStream(img));
			resp.getOutputStream().write(image);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
