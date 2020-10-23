package single_server;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;

public class Receive extends Thread{

	/*
	 * 클라이언트에서 넘어온 메시지를 수신 받는 클래스
	 * 생성자에서 연결된 소켓타입을 하나 받는다.
	 */
	private Socket socket;

	public Receive(Socket socket) {
		this.socket = socket;
	}

	@Override
	public void run() {
		try {
			//1. 전송받은 데이터는 socket클래스 안에 inputStream에 저장되고
			// 그 데이터를 받아 꺼내오는 코드
			InputStream is = socket.getInputStream();
			BufferedReader bf = new BufferedReader(new InputStreamReader(is,"UTF-8"));
			
			//2. client에서 메세지가 넘어올 때마다 서버측에 출력.
			//message가 null이라는 것은 클라이언트 측에서 연결이 끊겼다는 뜻이므로 탈출.
			while(true) {
				
				String msg = bf.readLine();
				if(msg == null) {
					System.out.println("연결을 종료합니다.");
					break;
				}else {
					System.out.println("사용자 :"+msg);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();	
		}

	}



}
