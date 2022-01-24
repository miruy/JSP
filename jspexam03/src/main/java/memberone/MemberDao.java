package memberone;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

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
//	private static MemberDao instance = null;
//	private MemberDao() {}
//	public static MemberDao getInstance() {
//		if(instance == null) {
//			synchronized(MemberDao.class) {
//				instance = new MemberDao();
//			}
//		}
//		return instance;
//	}		
	
//	private static DataSource ds = null;
//	{
//		try {
//			Context init = new InitialContext();
//			ds = (DataSource)init.lookup("java:comp/env/jdbc/myOracle");
//		}catch(Exception e){
//			System.out.println("Connection 실패");
//		}
//	}
	
//	public Connection getConnection() throws SQLException{
//		return ds.getConnection();
//	}
	
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
	
	public boolean memberInsert(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			conn = getConnection();
			String strQuery = "insert into MEMBER values(?,?,?,?)";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getEmail());
			pstmt.setTimestamp(4, Timestamp.valueOf(LocalDateTime.now()));
			int count = pstmt.executeUpdate();
			if(count > 0) flag = true;
		}catch(Exception e) {
			System.out.println("Exception" + e);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return flag;
	}
	public int loginCheck(String id, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;
		try {
			conn = getConnection();
			String query = "select PASS from MEMBER where ID = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbPass = rs.getString("pass");
				if(pass.equals(dbPass)) check = 1;
				else					check = 0;
			}
		}catch(Exception e) {
			System.out.println("Exception" + e);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return check;
	}
	
	public MemberDto getMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto dto = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from MEMBER where ID = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {	//ID에 해당하는 회원이 존재한다면 
				dto = new MemberDto();
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getTimestamp("regdate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception" + e);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return dto;
	}
	
	public void memberUpdate(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update MEMBER set PASS = ?, EMAIL = ? where ID = ?");
			pstmt.setString(1, dto.getPass());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getId());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("Exception" + e);
		}finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
	}
	
	public int deleteMember(String id, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPass = "";	//데이터베이스에 실제 저장된 비밀번호
		int result = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select PASS from MEMBER where ID = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbPass = rs.getString("pass");
				if(dbPass.equals(pass))	{	//true면 본인 확인 성공
					pstmt.close();
					pstmt = conn.prepareStatement("delete from MEMBER where ID = ?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					result = 1;	//회원탈퇴 성공
				}else{	//본인 확인 실패 - 비밀번호 오류 
					result = 0;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception" + e);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return result;

	}
}
		
	











