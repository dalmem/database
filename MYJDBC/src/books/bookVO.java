package books;

public class bookVO {
	private int bno;
	private String code;
	private String bname;
	private String rentYN;
	public bookVO(int bno, String code, String bname, String rentYN) {
		super();
		this.bno = bno;
		this.code = code;
		this.bname = bname;
		this.rentYN = rentYN;
	}
	public bookVO(int bno) {
		this.bno = bno;
	}
	public bookVO(String rentYN) {
		this.rentYN = rentYN;;
	}
	
	public bookVO() {
		super();
	}
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getRentYN() {
		return rentYN;
	}
	public void setRentYN(String rentYN) {
		this.rentYN = rentYN;
	}
	
	
}
