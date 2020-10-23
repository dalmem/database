package rentlist;

public class rentVO {
	private int lno;
	private int date;
	private int bno;
	private int mno;
	private String returnYN;
	public rentVO() {
		super();
	}
	public rentVO(int lno, int date, int bno, int mno, String returnYN) {
		super();
		this.lno = lno;
		this.date = date;
		this.bno = bno;
		this.mno = mno;
		this.returnYN = returnYN;
	}
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public int getDate() {
		return date;
	}
	public void setDate(int date) {
		this.date = date;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getReturnYN() {
		return returnYN;
	}
	public void setReturnYN(String returnYN) {
		this.returnYN = returnYN;
	}
	
}
