package single_server;

import java.net.ServerSocket;
import java.net.Socket;

public class MainServer {

	public static void main(String[] args) {
		
		try {
			ServerSocket serverSocket = new ServerSocket(8383);
			
			System.out.println("연결대기");
			Socket socket = serverSocket.accept();
			
			System.out.println("Welcome to my server");
			
			//연결된 소켓을 메시지를 수신받는 클래스한테 전달합니다.
			Receive receive = new Receive(socket);	

			//
			Sender sender = new Sender(socket);
			
			
			receive.start();
			sender.start();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
