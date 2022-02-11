package sample.address;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/addr")
public class AddressServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/address.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//req.setCharacterEncoding("utf-8");
		String memberName = req.getParameter("memberName");
		String postcode = req.getParameter("postcode");
		String address = req.getParameter("address");
		String detailAddress = req.getParameter("detailAddress");
		String extraAddress = req.getParameter("extraAddress");
		
		System.out.println("등록할 정보");
		System.out.println("이름:" + memberName);
		System.out.println("우편번호:" + postcode);
		System.out.println("주소:" + address);
		System.out.println("상세주소:" + detailAddress);
		System.out.println("참고사항:" + extraAddress);
		System.out.println("위 내용을 사용");
		
		resp.sendRedirect(req.getContextPath()+"/address.jsp");
	}
}

