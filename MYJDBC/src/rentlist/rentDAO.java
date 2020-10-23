package rentlist;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class rentDAO implements InterRent{
	private final String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	private final String uid = "user01";
	private final String upw = "user01";
	public rentDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.println("클래스 로더 에러");
		}
	}
	@Override
	public int add(rentVO vo) {
		int result = 0;//결과 반환변수
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into lists values(?,sysdate,?,?,?)";
		try {
			conn = DriverManager.getConnection(url,uid,upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getLno());			
			pstmt.setInt(3, vo.getBno());
			pstmt.setInt(4, vo.getMno());
			pstmt.setString(5, vo.getReturnYN());
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
		return result;	}

	@Override
	public void view() {
		String url ="jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "user01";
		String upw = "user01";
		
		
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		String sql = "select * from lists order by lno";

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
			System.out.println("no.\t반납일\t책번호\t대여자\t대여상태");
			while(rs.next()) {
				
				System.out.print("   "+rs.getString("lno")+" " );
				System.out.print("    "+rs.getString("returndate")+"\t " );
				System.out.print(rs.getString("bno") +"  ");
				System.out.print(rs.getString("mno") +" ");
				System.out.print(rs.getString("returnYN") +" ");
				System.out.println();
			}
			
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
		// TODO Auto-generated method stub
		
	}
	
}
