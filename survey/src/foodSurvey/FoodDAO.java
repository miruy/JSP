package foodSurvey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FoodDAO {
	private static FoodDAO instance;
	private JdbcTemplate jdbcTemplate;
	
	private FoodDAO() {
		jdbcTemplate = JdbcTemplate.getInstance();
	}
	
	public static FoodDAO getInstance() {
		synchronized(FoodDAO.class) {
			if(instance == null) {
				instance = new FoodDAO();
			}	
		}
		return instance;
	}
	
	//CRUD
	public int insert(FoodVO fv) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into FOOD (NUM, MENU, VOTE) values (FOOD_SEQ.nextval, ?, 1)";
		int result = -1;
		
		try {
			conn = jdbcTemplate.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, fv.getMenu());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	public List<FoodVO> selectAll(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FoodVO> result =  new ArrayList<>();
		String sql = "select * from FOOD order by NUM asc";
		
		try {
			conn = jdbcTemplate.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FoodVO fv = new FoodVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getInt(3));
				result.add(fv);	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	public int update(String food) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update FOOD set VOTE = vote+1 where MENU = ?";
		int result = -1;
		
		try {
			conn = jdbcTemplate.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, food);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
}












