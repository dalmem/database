package basic.client;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;

public class MainClient {
	public static void main(String[] args) {

		try {
			//첫번째 생성자의 매개변수 : IP주소 , PORT번호
			Socket socket = new Socket("192.168.104.39",8383);
			
			//소켓 클래스의 inputStream으로 서버로 부터 데이터를 받습니다.
			InputStream is =socket.getInputStream();
			//서버로 부터 받은 데이터를 문자열 데이터로 변경
			BufferedReader bf = new BufferedReader(new InputStreamReader(is,"UTF-8"));
			
			String result = bf.readLine();
			System.out.println(result);
			
			socket.close();
			
		} catch (Exception e) {
			
		}
		
	}
}
