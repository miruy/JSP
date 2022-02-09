package refRoom;

public class refRoomDto {
	private int num;
	private String upLoader;
	private String subject;
	private String contents;
	private String pass;
	private int readcount;
	
	public refRoomDto() {}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUpLoader() {
		return upLoader;
	}

	public void setUpLoader(String upLoader) {
		this.upLoader = upLoader;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
}
