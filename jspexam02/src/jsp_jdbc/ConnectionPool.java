package jsp_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public class ConnectionPool {
	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	private ArrayList<Connection> freed;	//사용 전 Connection
	private ArrayList<Connection> used;		//사용 중 Connection
	private String user = "admin";
	private String password = "YUYUyuyu25864966?";
	private String url = 
			"jdbc:oracle:thin:@DB202112211148_medium?TNS_ADMIN=/Users/kim-yurim/Documents/workspace/Wallet_DB202112211148";
	private int initCons = 10;	//초기 Connection
	private int maxCons = 20;	//최대 Connection
	private int numCons = 0;	//전체 Connection
	private static ConnectionPool cp;
	public static ConnectionPool getInstance() {
		try {
			if(cp == null) {
				synchronized(ConnectionPool.class) {
					cp = new ConnectionPool();
				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}return cp;
	}
	private ConnectionPool() throws SQLException{
		/*
		 * 초기 Connection 개수를 각각의 ArrayList에 저장 할 수 있도록
		 * 초기 Connection 수 만큼 생성
		 */
		freed = new ArrayList<Connection>(initCons);
		used = new ArrayList<Connection>(initCons);
		//initCons의 수 만큼 Connection생성
		while(numCons < initCons) {
			addConnection();
		}
	}
	private void addConnection() throws SQLException{
		freed.add(getNewConnection());
	}
	
	private Connection getNewConnection() throws SQLException{
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		System.out.println("About to connect to " + conn);
		numCons++;
		return conn;
	}
	//요청이 왔을 때 freed에 있는 Connection을 used로 옮기는 기능 
	public synchronized Connection getConnection() throws SQLException{
		if(freed.isEmpty()) {
			while(numCons < maxCons) {
				addConnection();
			}
		}
		Connection _conn = freed.get(freed.size()-1);
		freed.remove(_conn);
		used.add(_conn);
		return _conn;
	}
	//요청처리가 끝나면 used의 Connection객체를 freed로 옮기는 기능
	public synchronized void releaseConnection(Connection _conn) throws SQLException{
		boolean flag = false;
		if(used.contains(_conn)) {
			used.remove(_conn);
			numCons--;
			flag = true;
		}else {
			throw new SQLException("ConnectionPool에 없습니다.");
		}try {
			if(flag) {
				freed.add(_conn);
				numCons++;
			}else {
				_conn.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	//모든 Connection삭제
	public void closeAll() {
		//사용중인 모든 Connection객체 삭제
		for(int i = 0; i < used.size(); i++) {
			Connection _conn = used.get(i);
			used.remove(i--);
			try {
				_conn.close();
			}catch(SQLException e) {
				try {
					_conn.close();
				}catch(SQLException el) {
					el.printStackTrace();					
				}
			}
		}
		//사용 전인 모든 Connection객체 삭제 
		for(int i = 0; i < freed.size(); i++) {
			Connection _conn = freed.get(i);
			freed.remove(i--);
			try {
				_conn.close();
			}catch(SQLException e) {
				try {
					_conn.close();
				}catch(SQLException el){
					el.printStackTrace();
				}
			}
		}
	}
	public int getNumCons() {
		return numCons;
	}
}



