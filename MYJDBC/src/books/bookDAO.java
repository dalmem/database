package books;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class bookDAO implements InterBook{
	private final String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	private final String uid = "user01";
	private final String upw = "user01";
	
	public bookDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.println("클래스 로더 에러");
		}
	}
	@Override
	public int add(bookVO vo) {
		int result = 0;//결과 반환변수
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into books values(?,?,?,?)";
		try {
			conn = DriverManager.getConnection(url,uid,upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBno());
			pstmt.setString(2, vo.getCode());
			pstmt.setString(3, vo.getBname());
			pstmt.setString(4, vo.getRentYN());
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

	@Override
	public void view() {
		String url ="jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "user01";
		String upw = "user01";
		
		
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		String sql = "select * from books order by bno";

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
			System.out.println("책번호\t책코드\t책제목\t대여상태");
			while(rs.next()) {
				
				System.out.print("   "+rs.getString("bno")+" " );
				System.out.print("    "+rs.getString("code")+"\t " );
				System.out.print(rs.getString("bname") +"  ");
				System.out.print(rs.getString("rentYN") +" ");
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
		
	}

	@Override
	public void view(bookVO vo) {
		// TODO Auto-generated method stub
		String url ="jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "user01";
		String upw = "user01";
		Scanner scan = new Scanner(System.in);
		
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		String sql = "select * from books"				
				+ "where bname =?";

		try {
			//2. 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//3. 커넥션 생성
			conn = DriverManager.getConnection(url,uid,upw);
			//4. sql문 전달객체 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getBname());//파라미터 값 세팅
			//5. sql문 실행
			rs = pstmt.executeQuery();
			//6. 결과 객체 처리
			while(rs.next()) {
				System.out.println("책번호: "+rs.getString("bno") );
				System.out.println("책코드: "+rs.getString("code") );
				System.out.println("책제목: "+rs.getString("bname") );
				System.out.println("대여상태: "+rs.getString("rentYN") );
				
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
	}

	@Override
	public int update(bookVO vo) {
		int result = 0;//결과 반환변수
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update books set rentYN = ? where bno =?";
		try {
			conn = DriverManager.getConnection(url,uid,upw);
			pstmt = conn.prepareStatement(sql);
			
			Scanner scan = new Scanner(System.in);
			System.out.print("대여 상태 변경할 책 번호 > ");
			int cond = scan.nextInt();
			pstmt.setInt(2, cond);
			System.out.print("대여 상태 변경 > ");
			String cond1 = scan.next();
			pstmt.setString(1, cond1);
			
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
