package refRoom;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class refRoomDao {
	private static refRoomDao instance = null;
	private DataSource pool;
	
	private refRoomDao() {
		try {
			Context ctx = new InitialContext();
			pool = (DataSource)ctx.lookup("java:comp/env/jdbc/myOracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static refRoomDao getInstance() {
		synchronized(refRoomDao.class) {
			if(instance == null) {
				instance = new refRoomDao();
			}	
		}
		return instance;
	}
	
	//여기부터 자료실 기능에 필요한 메서드 구현 
}
