package members;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class memberDAO implements InterMember{
	private final String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	private final String uid = "user01";
	private final String upw = "user01";
	
	public memberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.println("클래스 로더 에러");
		}
	}
	public int add(memberVO vo) {
		int result = 0;//결과 반환변수
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into members_test values(?,?,?)";
		try {
			conn = DriverManager.getConnection(url,uid,upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMno());
			pstmt.setInt(2, vo.getPhone());
			pstmt.setString(3, vo.getName());
			//sql문 실행
			result = pstmt.executeUpdate();
		} catch (Exception e) {

		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (Exception e2) {
				
			}
		}		
		return result;
		
	}

	
	public void search(memberVO vo) {
		String url ="jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "user01";
		String upw = "user01";
		Scanner scan = new Scanner(System.in);
		
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		String sql = "select * from members_test m left outer join (select * from lists l left outer join books b on l.bno = b.bno) a on m.mno = a.mno where name = ?";

		try {
			//2. 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//3. 커넥션 생성
			conn = DriverManager.getConnection(url,uid,upw);
			//4. sql문 전달객체 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getName());//파라미터 값 세팅
			//5. sql문 실행
			rs = pstmt.executeQuery();
			//6. 결과 객체 처리
			while(rs.next()) {
				System.out.print(rs.getString("name"));
				System.out.print(rs.getString("bname"));
				System.out.print(rs.getString("returnYN"));
				
			}System.out.println();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (SQLException e) {	
				e.printStackTrace();
			}
		}
		
	}
	public void search() {
		String url ="jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "user01";
		String upw = "user01";
		Scanner scan = new Scanner(System.in);
		
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		String sql = "select * from members_test order by mno";

		try {
			//2. 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//3. 커넥션 생성
			conn = DriverManager.getConnection(url,uid,upw);
			//4. sql문 전달객체 생성
			pstmt = conn.prepareStatement(sql);
			//5. sql문 실행
			rs = pstmt.executeQuery();
			//6. 결과 객체 처리
			System.out.println("회원번호\t 연락처\t\t이름");System.out.println("----------------------------------------");
			while(rs.next()) {
				
				System.out.print("    "+rs.getString("mno")+"  " );
				System.out.print("  "+rs.getString("phone")+"\t" );
				System.out.print(rs.getString("name") +" ");
				System.out.println();
			}System.out.println("----------------------------------------");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (SQLException e) {	
				e.printStackTrace();
			}
		}
		
	}

	
	public int delete(memberVO vo) {
		int result = 0;//결과 반환변수
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from members_test where name =?";
		try {
			conn = DriverManager.getConnection(url,uid,upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			
			//sql문 실행
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {

		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (Exception e2) {
				
			}
		}		
		return result;
	}
	
	
}
