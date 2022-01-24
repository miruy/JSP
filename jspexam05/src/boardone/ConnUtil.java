package boardone;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnUtil {
	private static DataSource ds;
	static {
		try {
			InitialContext stx = new InitialContext();
			ds = (DataSource)stx.lookup("java:comp/env/jdbc/myOracle");
		}catch(NamingException e) {}
	}
	
	public static Connection getConnection() throws SQLException{
		return ds.getConnection();
	}
}
