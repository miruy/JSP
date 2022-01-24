package boardone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardDao {
	private static BoardDao instance = null;
	private BoardDao() {}
	public static BoardDao getInstance() {
		if(instance == null) {
			synchronized(BoardDao.class) {
				instance = new BoardDao();
			}
		}
		return instance;
	}
	
	public void insertArticle(BoardDto article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = article.getNum();
		int ref = article.getRef();
		int step = article.getStep();
		int depth = article.getDepth();
		int number = 0;
		String sql = "";
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select max(NUM) from BOARD");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			}else {
				number = 1;
			}
			if(num != 0) {	//답글 일 경우 
				sql = "update BOARD set STEP = STEP+1 where REF = ? and STEP > ?";
				pstmt.close();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeQuery();
				step++;
				depth++;
			}else {	//새글 일 경우 
				ref = number;
				step = 0;
				depth = 0;
			}
			//쿼리 작성
				sql = "insert into BOARD"
						+ "(NUM, WRITER, EMAIL, SUBJECT, PASS,"
						+ "REGDATE, REF, STEP, DEPTH, CONTENT, IP)"
						+ "values(BOARD_SEQ.nextval, ?,?,?,?,?,?,?,?,?,?)";
				pstmt.close();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, article.getWriter());
				pstmt.setString(2, article.getEmail());
				pstmt.setString(3, article.getSubject());
				pstmt.setString(4, article.getPass());
				pstmt.setTimestamp(5, article.getRegdate());
				pstmt.setInt(6, ref);
				pstmt.setInt(7, step);
				pstmt.setInt(8, depth);
				pstmt.setString(9, article.getContent());
				pstmt.setString(10, article.getIp());
				pstmt.executeQuery();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException e) {}
				if(pstmt != null) try {pstmt.close();}catch(SQLException e) {}
				if(conn != null) try {conn.close();}catch(SQLException e) {}
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
