package multi_server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.HashMap;

public class ClientManage extends Thread {

	private Socket socket;
	private String userId; //유저 아이디를 저장할 변수
	private int index=0;
	public ClientManage(Socket socket) {
		this.socket = socket;
	}


	@Override
	public void run() {
		System.out.println(socket.getPort());
		try {
			//클라이언트로 부터 넘어온 입력스트림을 받는다.
			InputStream is = socket.getInputStream();
			BufferedReader bf = new BufferedReader(new InputStreamReader(is, "UTF-8"));

			while(true) {
				String message = bf.readLine();
				System.out.println(this.userId + ">"+message);
				//1. message가 null인 경우 연결이 끊어졌다는 의미
				if(message == null) {
					System.out.println(this.userId + "님이 퇴장했습니다");

					//연결된 모든 소켓에 메시지를 전달.
					for(int i = 0; i < MainServer.list.size(); i++) {
						PrintWriter out = MainServer.list.get(i);
						out.println(this.userId + "님이 퇴장했습니다");
						out.flush();
					}
					break; //현재 클라이언트와 연결된 스레드가 종료.
				}


				//2. 넘어온 메시지가 id인지 확인하는 부분
				String[] split = message.split(":");
				if(split.length == 2 && split[0].equals("닉네임") ) {
					this.userId = split[1];
					System.out.println(this.userId + "님이 입장했습니다");
					MainServer.map.put(this.userId,socket.getPort());
					MainServer.map1.put(socket.getPort(), MainServer.list.get(index++));
					
					//연결된 모든 소켓에 메시지를 전달.
					for(int i = 0; i < MainServer.list.size() ; i++) {
						PrintWriter out = MainServer.list.get(i);
						out.println(this.userId + "님이 입장했습니다");
						out.flush(); //송신
					}
					continue; //처음으로 돌아간다.
				}

				if(message.contains("/w")){
					String[] sp = message.split(" ",3);

						if(MainServer.map.containsKey(sp[1])) {
							PrintWriter out = MainServer.map1.get(MainServer.map.get(	sp[1]));
							out.println(this.userId+"님이 보낸 귓속말 >"+sp[2]);
							out.flush();	
						
					}
				}else {
					//일반메시지를 모든 소켓에 전달.
					for(int i = 0; i < MainServer.list.size(); i++) {
						PrintWriter out = MainServer.list.get(i);
						out.println(this.userId + ">" + message );
						out.flush();
					}

				}

			}



		} catch (Exception e) {
			e.printStackTrace();
		} finally { 
			//종료시점에 실행되는 finally문
			try {
				MainServer.list.remove(new PrintWriter(socket.getOutputStream()) );

			} catch (IOException e) {
			}
		}


	}



}
