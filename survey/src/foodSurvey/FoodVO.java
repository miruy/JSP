package foodSurvey;

public class FoodVO {
	private int num;
	private String menu;
	private int vote;
	
	public FoodVO() {}
	
	public FoodVO(int num, String menu, int vote) {
		this.num = num;
		this.menu = menu;
		this.vote = vote;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getVote() {
		return vote;
	}
	public void setVote(int vote) {
		this.vote = vote;
	}
	@Override
	public String toString() {
		return "FoodVO [num=" + num + ", menu=" + menu + ", vote=" + vote + "]";
	}
	
}
