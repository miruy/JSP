package foodSurvey;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcTamplate {
	private static JdbcTamplate instance;
		
	String user = "admin";
	String pass = "YUYUyuyu25864966?";
	String url = "jdbc:oracle:thin:@DB202112211148_medium?TNS_ADMIN=/Users/kim-yurim/Documents/workspace/Wallet_DB202112211148";

	private JdbcTamplate() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("클래스 로딩 성공");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	}
	
	public static JdbcTamplate getInstance() {
		if(instance == null) {
			instance = new JdbcTamplate();
		}
		return instance;
	}
	
	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(user,pass,url);
	}
}











