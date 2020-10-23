package multi_server;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;

public class MainServer {
	//서버에 접속하는 클라이언트의 output을 저장할 리스트.
	public static HashMap<String,Integer> map = new HashMap<>();
	public static HashMap<Integer,PrintWriter> map1 = new HashMap<>();
	public static ArrayList<PrintWriter> list = new ArrayList<>();
	
	public static void main(String[] args) {
		/*
		 * 채팅은, 클라이언와 클라이언트 간의 대화입니다. 
		 * 즉 서버의 역할은 클라이언트의 채팅글을 전달만하고, 채팅을 참여하진 않습니다.
		 * 그래서 서버는 여러 클라이언트를 서로 연결할 수 있게 하고,
		 * 클라이언트에게 받은 데이터를 모든 클라이언트에게 전달하도록 처리합니다.
		 */
		try {
			ServerSocket serverSocket = new ServerSocket(8383);
			
			while(true) {
				System.out.println("-----연결 대기-----");
				Socket socket = serverSocket.accept();
				System.out.println("-----연결 성공-----");
				
				//연결이 들어올 때 마다, 클라이언트관리 클래스를 생성하고, 연결된 소켓의 output을 리스트에 저장
				ClientManage client = new ClientManage(socket);
				list.add(new PrintWriter(socket.getOutputStream()));
				
				client.start();
				//System.out.println(MainServer.list.toString());
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
