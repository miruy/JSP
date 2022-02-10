package refRoom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class RefRoomDao {
	private static RefRoomDao instance = null;
	private DataSource pool;
	
	private RefRoomDao() {
		try {
			Context ctx = new InitialContext();
			pool = (DataSource)ctx.lookup("java:comp/env/jdbc/myOracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static RefRoomDao getInstance() {
		synchronized(RefRoomDao.class) {
			if(instance == null) {
				instance = new RefRoomDao();
			}	
		}
		return instance;
	}
	
	//여기부터 자료실 기능에 필요한 메서드 구현 
	
	
	public void uploadFile(RefRoomDto uploadFile) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = uploadFile.getNum();
		int number = 0;
		String sql = "";
		
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select max(NUM) from REFROOM");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			}else {
				number = 1;
			}
			sql = "insert into REFROOM"
				+ "(NUM, UPLOADER, PASS, SUBJECT, CONTENT)"
				+ "values(REFROOM_SEQ.nextval, ?,?,?,?)";
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uploadFile.getUpLoader());
			pstmt.setString(2, uploadFile.getPass());
			pstmt.setString(3, uploadFile.getSubject());
			pstmt.setString(4, uploadFile.getContent());
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
	
////	게시물 조회수 메서드 
//	public int getArticleCount() {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		int count = 0;
//		
//		try {
//			conn = pool.getConnection();
//			pstmt = conn.prepareStatement(
//					"select count(*) from REFROOM");
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				count = rs.getInt(1);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			if(rs != null) try {rs.close();}catch(SQLException e) {}
//			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {}
//			if(conn != null) try {conn.close();}catch(SQLException e) {}
//		}
//		return count;
//	}
//	
////	게시글 불러오는 list메서드 
//	public List<RefRoomDto> getArticles(){
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		List<RefRoomDto> articleList = null;
//		
//		try {
//			conn = pool.getConnection();
//			pstmt = conn.prepareStatement("select * from BOARD order by NUM desc");
//			
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				articleList = new ArrayList<RefRoomDto>();
//				do {
//					RefRoomDto article = new RefRoomDto();
//					article.setNum(rs.getInt("num"));
//					article.setUpLoader(rs.getString("upLoader"));
//					article.setPass(rs.getString("pass"));
//					article.setSubject(rs.getString("subject"));
//					article.setContent(rs.getString("content"));
//					article.setReadcount(rs.getInt("readcount"));
//					articleList.add(article);
//				}while(rs.next());
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			if(rs != null) try {rs.close();}catch(SQLException e) {}
//			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {}
//			if(conn != null) try {conn.close();}catch(SQLException e) {}
//		}
//		return articleList;
//	}
//	
////		게시물 읽을 때마다 조회수 올라가는 메서드 
//	public RefRoomDto getArticle(int num) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		RefRoomDto article = null;
//		
//		try {
//			conn = pool.getConnection();
//			pstmt = conn.prepareStatement(
//					"update REFROOM set READCOUNT = READCOUNT+1 where NUM = ?");
//			pstmt.setInt(1, num);
//			pstmt.executeQuery();
//			pstmt.close();
//			pstmt = conn.prepareStatement(
//					"select * from REFROOM where NUM = ?");
//			pstmt.setInt(1, num);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				article = new RefRoomDto();
//				article.setNum(rs.getInt("num"));
//				article.setUpLoader(rs.getString("upLoader"));
//				article.setPass(rs.getString("pass"));
//				article.setSubject(rs.getString("subject"));
//				article.setContent(rs.getString("content"));
//				article.setReadcount(rs.getInt("readcount"));
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			if(rs != null) try {rs.close();}catch(SQLException e) {}
//			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {}
//			if(conn != null) try {conn.close();}catch(SQLException e) {}
//		}
//		return article;

	




















