package memberone;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
	public static String ID = "admin";
	public static String PASSWORD = "YUYUyuyu25864966?";
	public static String IP = "jdbc:oracle:thin:@db202112211148_high?TNS_ADMIN=/Users/kim-yurim/Documents/workspace/Wallet_DB202112211148";
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() throws SQLException{
		return DriverManager.getConnection(IP, ID, PASSWORD);
	}
	public boolean idCheck(String id) {
		boolean result = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from MEMBER where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(!rs.next()) result = false;
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			if(rs != null) 
				try {
					rs.close();
				}catch(SQLException sqle1) {}
				if(pstmt != null) 
					try {
						pstmt.close();
					}catch(SQLException sqle2) {}
					if(conn != null) 
						try {
							conn.close();
						}catch(SQLException sqle3) {}
					}
					return result;
				}
			}
		













