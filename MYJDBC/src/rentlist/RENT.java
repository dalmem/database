package rentlist;

import java.util.Scanner;

import books.bookVO;

public class RENT {
	
	static public void rent() {
		Scanner scan = new Scanner(System.in);
		System.out.println("[1. 리스트추가, 2. 리스트 조회]");
		int menu1 = scan.nextInt();
		InterRent dao = new rentDAO();
		rentVO vo =null;
		switch (menu1) {
		case 1:
			System.out.print("no > ");
			int lno = scan.nextInt();
			System.out.print("반납일> ");
			int date = scan.nextInt();
			System.out.print("책번호 > ");
			int bno = scan.nextInt();
			System.out.print("대여자 > ");
			int mno = scan.nextInt();
			System.out.print("대여상태 > ");
			String returnYN = scan.next();
			vo= new rentVO(lno,date,bno,mno,returnYN);
			int result = dao.add(vo);
			if (result == 1) {
				System.out.println("추가완료");
				
			}else
				System.out.println("추가실패 ");
			break;
		case 2:
			dao.view();
			break;
		}
	}
}
