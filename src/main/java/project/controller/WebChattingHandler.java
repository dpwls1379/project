package project.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebChattingHandler extends TextWebSocketHandler {
	
Map<String, WebSocketSession> users=new HashMap<String,WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 처음에 연결(세션저장)
		users.put(session.getId(), session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 연결해제
		users.remove(session.getId());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		String msg=message.getPayload();
		TextMessage tMsg=new TextMessage(msg.substring(4));//앞에 4글자 떼어내고 보내기
		Collection<WebSocketSession> list=users.values();//아이디빼고 세션값만 갖고오라는
		for(WebSocketSession ws:list){
			ws.sendMessage(tMsg);
		}
	}
	
}
