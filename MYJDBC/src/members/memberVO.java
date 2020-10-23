package members;

public class memberVO {
	private int mno;
	private String name;
	private int phone;
	public memberVO(int mno, String name, int phone) {
		super();
		this.mno = mno;
		this.name = name;
		this.phone = phone;
	}
	public memberVO(String name) {
		this.name = name;
	}
	public memberVO() {
		super();
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	
	
	
	
	
}
