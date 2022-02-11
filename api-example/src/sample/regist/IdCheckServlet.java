package sample.regist;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/idCheck")
public class IdCheckServlet  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String dbId = "tester";

		PrintWriter pw = new PrintWriter(resp.getOutputStream());

		String id = req.getParameter("id");
		String responseString = "";
		if(id.equals(dbId)) {
			responseString += "<span style='color:green'>사용할 수 있는 아이디 입니다.</span>";
		}else {
			responseString += "<span style='color:red'>사용할 수 없는 아이디 입니다.</span>";
		}
		pw.println(responseString);
		pw.close();
	}
}
