package main;

import java.util.Scanner;

import member.dao.InterMember;
import member.dao.MemberDAO;
import member.dao.MemberVO;

public class MainClass {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		InterMember dao = new MemberDAO();
		
		while(true) {
			System.out.println("[1.추가  2.조회  3.삭제]");
			int menu = scan.nextInt();
			switch (menu) {
			case 1:
				
				System.out.print("id > ");
				String id = scan.next();
				
				System.out.print("pw > ");
				String pw = scan.next();
				
				System.out.print("name > ");
				String name = scan.next();
				
				System.out.print("email > ");
				String mail = scan.next();
				MemberVO vo = new MemberVO(id, pw, name, mail);
				
				int result = dao.insertMember(vo);
				
				if(result == 1) {
					System.out.println("DB저장 성공");
				}else {
					System.out.println("DB저장 실패");
				}
				break;
			case 2:
				
				break;
			case 3:
	
				break;

			default:
				break;
			}
		}
	}
}
