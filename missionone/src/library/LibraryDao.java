package library;

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

public class LibraryDao {
	private static LibraryDao instance = null;
	private DataSource pool;

	private LibraryDao() {
		try {
			Context ctx = new InitialContext();
			pool = (DataSource) ctx.lookup("java:comp/env/jdbc/myOracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static LibraryDao getInstance() {
		synchronized (LibraryDao.class) {
			if (instance == null) {
				instance = new LibraryDao();
			}
		}
		return instance;
	}

	// 여기부터 자료실 기능에 필요한 메서드 구현

	// 파일 리스트 가져오는 메서드 (list.jsp)
	public List<LibraryDto> getFileList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<LibraryDto> fileList = null;

		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement("select * from LIBRARY order by NUM desc");

			rs = pstmt.executeQuery();

			if (rs.next()) {
				fileList = new ArrayList<LibraryDto>();
				do {
					LibraryDto file = new LibraryDto();
					file.setNum(rs.getInt(1));
					file.setFileUpload(rs.getString(2));
					file.setUploader(rs.getString(3));
					file.setPass(rs.getString(4));
					file.setContent(rs.getString(5));
					file.setReadcount(rs.getInt(6));
					fileList.add(file);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
		return fileList;
	}

	// 전체 글 수 메서드 (list.jsp)
	public int getFileCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement("select count(*) from LIBRARY");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
		return count;
	}

	// 글 내용가져오는 메서드 (content.jsp)
	public LibraryDto getContent(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LibraryDto file = null;
		
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(
					"select * from LIBRARY where NUM = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				file = new LibraryDto();
					file.setNum(rs.getInt(1));
					file.setFileUpload(rs.getString(2));
					file.setUploader(rs.getString(3));
					file.setPass(rs.getString(4));
					file.setContent(rs.getString(5));
					file.setReadcount(rs.getInt(6));
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
		return file;
	}
	
	// 조회수 올라가는 메서드 (content.jsp)
	public void readCountUp(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement("update LIBRARY set READCOUNT = READCOUNT+1 where NUM = ?");
			pstmt.setInt(1, num);

			result = pstmt.executeUpdate();
			pstmt.close();

			if (result == 1) {
				System.out.println(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
		
	}

	// 파일 업로드 메서드 (uploadFProc.jsp)
	public int upload(LibraryDto uploadFile) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(
					"insert into LIBRARY (NUM, FILE_UPLOAD, UPLOADER, PASS, CONTENT, READCOUNT) values (LIBRARY_SEQ.nextval, ?, ?, ?, ?, 0)");

			pstmt.setString(1, uploadFile.getFileUpload());
			pstmt.setString(2, uploadFile.getUploader());
			pstmt.setString(3, uploadFile.getPass());
			pstmt.setString(4, uploadFile.getContent());

			result = pstmt.executeUpdate();

			if (result == 1) {
//				System.out.println(result);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
		return result;
	}

}
