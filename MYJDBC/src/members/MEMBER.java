package members;

import java.util.Scanner;

public class MEMBER {
	static public void MEMBER() {
		Scanner scan = new Scanner(System.in);
		System.out.println("[1. 회원 추가, 2. 회원 조회, 3. 전체 회원 조회  4. 회원 삭제]");
		int menu1 = scan.nextInt();
		InterMember dao = new memberDAO();
		switch (menu1) {
		case 1:
			
			System.out.print("회원 번호 > ");
			int mno = scan.nextInt();
			System.out.print("회원 연락처 > ");
			int phone = scan.nextInt();
			System.out.print("추가 할 회원 이름 > ");
			String name = scan.next();
			memberVO vo = new memberVO(mno, name, phone);
			int result = dao.add(vo);
			if(result == 1 )
				System.out.println("회원등록완료");
			else {
				System.out.println("회원등록실패");
			}
			break;
		case 2:
			System.out.print("조회할 회원 이름 > ");
			String name1 = scan.next();
			memberVO vo1 = new memberVO(name1);
			dao.search(vo1);
			break;
		case 3:
			
			dao.search();				
			break;
			
		case 4:
			System.out.print("삭제할 회원 이름 > ");
			String name2 = scan.next();
			memberVO vo2 = new memberVO(name2);
			int result1 = dao.delete(vo2);
			if(result1 == 1 )
				System.out.println("회원삭제완료");
			else {
				System.out.println("회원삭제실패");
			
			break;
		
		}}
	}
}
