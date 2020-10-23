import java.util.Scanner;

import books.BOOK;
import members.MEMBER;
import rentlist.RENT;

public class JDBCREQUEST {
	public static void main(String[] args) {

		/*
		 * 도서관리, 재고관리, 물품관리 등등 간단한 주제를 선택해서 JDBC프로그램을 연습합니다
		 * 
		 * 단, 테이블은 3개이상
		 * 인터페이스를 반드시 사용
		 * ArrayList를 반드시 사용해서
		 * 사용메서드는 6개이상,
		 * 
		 * 대여목록, 회원, 도서목록
		 * 
		 * 회원 테이블 : 회원추가, 회원조회, 회원삭제
		 * 대여목록 : 추가
		 * 도서목록 : 조회, 도서추가 , 대여상태 업데이트
		 * 테이블 설계-> DB구축 -> 코드작성
		 * 
		 */

		while (true) {



			Scanner scan = new Scanner(System.in);
			System.out.println("[1. 회원, 2. 도서, 3. 대여리스트	]");
			int menu = scan.nextInt();

			switch (menu) {
			case 1:
				MEMBER mem = new MEMBER();
				mem.MEMBER();
				break;
			case 2:
				BOOK book = new BOOK();
				book.book();
				break;
			case 3:
				RENT rent = new RENT();
				rent.rent();
				break;

			default:
				break;
			}

		}}
}
