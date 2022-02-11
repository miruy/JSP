package library;

public class LibraryDto {
	private int num;
	private String upLoader;
	private String pass;
	private String subject;
	private String content;
	private int readcount;
	
	public LibraryDto() {}

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

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	
}
