package test;

public class test {
	public static void main(String[] args) {
		
		
//		String a=null;
//		System.out.println(a.length());
//		
//		int[] b = new int[] {1,2,3,4,5};
//		System.out.println(b[5]);
//		
//		String c = "10A";
//		int d = Integer.parseInt(c);
		
		//Class.forName("java.#$%");
		System.out.println(sayNick("성재호",5));
	}
	public static String sayNick (String name, int index) {
		
		String[] arr = {"박장군","김원장","진회장","김재명"};
		int ran = (int)(Math.random()*index);
		try {
		return name +" 별명은 : "+arr[ran]+"입니다";
			
		} catch (ArrayIndexOutOfBoundsException e) {
			
			return "4 이하의 숫자를 입력해 주세요"; 
		}
	}
}
