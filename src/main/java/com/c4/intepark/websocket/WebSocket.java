package com.c4.intepark.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.c4.intepark.chat.model.service.ChatService;
import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.inteuser.model.vo.InteUser;

public class WebSocket extends TextWebSocketHandler {

	@Autowired
	ChatService chatService;

	private static final Logger logger = LoggerFactory.getLogger(WebSocket.class);

	private List<WebSocketSession> sessionList = new ArrayList<>();
	private Map<WebSocketSession, String> mapList = new HashMap<>();
	private Map<WebSocketSession, String> roomList = new HashMap<>();

	/* private List<String> userList = new ArrayList<>(); */

	/* 연결되었을때 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		logger.info("채팅 연결 성공");
		sessionList.add(session);
		
		  Map<String, Object> map = session.getAttributes(); 
		  System.out.println(map);
		  System.out.println(session);
		  if(map.get("loginUser") != null) { 
			  InteUser user = (InteUser)map.get("loginUser");
			  String userId = user.getUserid();
		  System.out.println(userId); 
		  mapList.put(session, userId); 
		  }else {
		  Constructors cons = (Constructors)map.get("loginCons"); 
		  String consId =  cons.getConsid();
		  System.out.println(consId);
		  mapList.put(session, consId); }
		 
	}

	// 통신 연결끊었을때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("연결 끊음");
	}

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("메세지 받음");
		String msg[] = message.getPayload().split("/");
		logger.info(msg[0]);
		System.out.println(session);
		
		if(msg[0].equals("invite")) {
			for(WebSocketSession websession : sessionList){ 
				if(msg[1].equals(mapList.get(websession))) { 
				System.out.println("세션 출력 시작");
				System.out.println(session);
				System.out.println(mapList.get(websession));
				websession.sendMessage(new TextMessage(msg[1])); 
				}
				
				} 
			}
		 
		/*
		 * roomList if(msg[0].equals())
		 */

		/*
		 * for(WebSocketSession websession : sessionList) {
		 * if(!session.getId().equals(websession.getId())) {
		 * websession.sendMessage(message); } }
		 */

	}

}
