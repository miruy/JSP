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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InitParamEx extends HttpServlet{

	@Override
	protected void doGet(
			HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		ServletConfig config = this.getServletConfig();
		String url = config.getInitParameter("url");
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
