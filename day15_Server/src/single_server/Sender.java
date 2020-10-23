package single_server;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;

public class Sender extends Thread{
	
	/*
	 * 서버측 메세지 전송 클래스
	 * 생성자로 연결된 소켓을 전달 받습니다.
	 */
	private Socket socket;

	public Sender(Socket socket) {
		this.socket = socket;
	}

	@Override
	public void run() {
			try {
				//사용자 한테 입력받음
				BufferedReader bf = new BufferedReader(new InputStreamReader(System.in,"UTF-8"));
				
				//출력스트림을 통해 연결된 소켓에 전달
				OutputStream os =socket.getOutputStream();
				PrintWriter out = new PrintWriter(os);
				while(true) {
					//사용자에게 입력받은 message
					String msg = bf.readLine();
					//out이 가르키는 client측으로 메세지 전달
					out.println(msg);
					out.flush();
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}	
	
	
	
}
