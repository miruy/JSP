package sample.video;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

@WebServlet(urlPatterns = "/video")
public class VideoFileSample extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//"file:///C:/dev/springtest/work/api-example/WebContent/Doraemon.png"
		String path = req.getServletContext().getRealPath("/videos");
		String fileName = req.getParameter("fileName");
		File video = new File(path, fileName);
		System.out.println(video.getAbsolutePath());
		System.out.println(video.exists());
		if(video.exists()) {
			BufferedInputStream is = new BufferedInputStream(new FileInputStream(video), 2048);
			//resp.setContentType("video/mp4");
			byte[] data = new byte[2048];
	        int read = 0;
	        while ((read = is.read(data)) > 0) {
	            resp.getOutputStream().write(data, 0, read);
	        }
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
