package servletex;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class Loader extends HttpServlet{
	@Override
	public void init() throws ServletException{
		try {
			String driver = getInitParameter("jdbcdriver");
			Class.forName(driver);
			System.out.println("DriverLoading Success!");
		}catch(Exception e) {
			System.out.println("DriverLoading Failed!");
			throw new ServletException(e);
		}
	}
}
