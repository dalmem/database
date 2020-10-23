package member.dao;

public class MemberVO {
	//데이터베이스 테이블이 가져야 할 컬럼을 변수로 선언.
		private String id;
		private String pw;
		private String name;
		private String email;
		
		
		public MemberVO(String id, String pw, String name, String email) {
			super();
			this.id = id;
			this.pw = pw;
			this.name = name;
			this.email = email;
		}
		public MemberVO() {
			super();
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPw() {
			return pw;
		}
		public void setPw(String pw) {
			this.pw = pw;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		
}
