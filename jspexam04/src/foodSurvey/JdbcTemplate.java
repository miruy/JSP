package foodSurvey;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcTemplate {
	private static JdbcTemplate instance;

	String user = "admin";
	String password = "YUYUyuyu25864966?";
	String url = "jdbc:oracle:thin:@DB202201222227_medium?TNS_ADMIN=/Users/kim-yurim/Documents/workspace/Wallet_DB202201222227";

	private JdbcTemplate() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("드라이버 클래스 로딩 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static JdbcTemplate getInstance() {
		if (instance == null) {
			instance = new JdbcTemplate();
		}
		return instance;
	}

	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, user, password);
	}
}
