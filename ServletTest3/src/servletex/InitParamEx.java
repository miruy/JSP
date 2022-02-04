package servletex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//웹서블릿 어노테이션 적용 : web.xml파일에 드라이버관련코드는 두고, 초기화관련코드 지움
//서블릿 등록 및 초기화 파라미터 적용
@WebServlet(
		urlPatterns = "/init",
		initParams = {							
//				@WebInitParam(name="url", value="jdbc:oracle:thin:@itthis.kr:1521:xe"),
				@WebInitParam(name="account", value="urimkim"),
				@WebInitParam(name="password", value="1234")
		})
//나머지 코드는 변경 없음 
public class InitParamEx extends HttpServlet{

	@Override
	protected void doGet(
			HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		ServletConfig config = this.getServletConfig();
//		String url = config.getInitParameter("url");	//초기화 파라미터에서 얻음, 수정 전 
		String url = this.getServletContext().getInitParameter("url");	//수정 후 
		String account = config.getInitParameter("account");
		String password = config.getInitParameter("password");
		
		try {
			conn = DriverManager.getConnection(
					url, account, password);
			System.out.println("Create new Connection!");
			String query = "select * from v$version";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			PrintWriter out = response.getWriter();
			
			while(rs.next()) {
				out.println(rs.getString(1));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(stmt != null) {stmt.close();}
				if(conn != null) {conn.close();}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
