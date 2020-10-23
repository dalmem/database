package basic_server;

import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class MainServer {

	public static void main(String[] args) {
		
		try {
			//서버소켓 생성(포트번호 8383)
			ServerSocket serverSocket = new ServerSocket(8383);
			
			/*
			 * 클라이언트의 연결 요청을 대기하는 메서드 accept()
			 * 즉, 클라이언트에서 해당 8383포트로 연결요청이 들어오면, accept가 대기를 해제하고
			 * 클라이언트와 연결시키는 Socket클래스 생성해서 반환
			 * 
			 */
			System.out.println("-------연결 대기--------");
			Socket socket = serverSocket.accept();
			//Socket클래스에 있는 출력스트림을 얻는코드
			OutputStream os = socket.getOutputStream();
			//메세지를 바이트형태로 바꿔서 접속한 클라이언트에 전달
			String msg = "서버에서 보낸 메세지";
			os.write(msg.getBytes());
			
			serverSocket.close();
			socket.close();
			System.out.println("연결해제");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
