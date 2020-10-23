package members;

import java.sql.ResultSet;

public interface InterMember {
	
	 /*
	  * 회원 추가 ,조회,삭제
	  */
	public int add(memberVO vo);
	public void search(memberVO vo);
	public void search();
	public int delete(memberVO vo);
}
