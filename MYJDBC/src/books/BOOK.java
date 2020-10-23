package books;

import java.util.Scanner;



public class BOOK {
	static public void book() {
		Scanner scan = new Scanner(System.in);
		System.out.println("[1. 도서추가, 2. 도서목록, 3. 도서검색, 4. 도서대여상태변경]");
		int menu1 = scan.nextInt();
		InterBook dao = new bookDAO();
		
		bookVO vo =null;
		switch (menu1) {
		case 1:
			System.out.print("책번호 > ");
			int bno = scan.nextInt();
			System.out.print("분류코드 > ");
			String code = scan.next();
			System.out.print("책제목 > ");
			String bname = scan.next();
			System.out.print("대여상태 > ");
			String rentYN = scan.next();
			vo= new bookVO(bno,code,bname,rentYN);
			dao.add(vo);
			break;
		case 2:
			dao.view();
			
			break;
		case 3:
			System.out.print("찾을 책 번호> ");
			int bno1 = scan.nextInt();
			vo = new bookVO(bno1);
			dao.view(vo);
			break;
		case 4:
			
			dao.update(vo);
			break;
		default:
			break;
		}
	}
}
