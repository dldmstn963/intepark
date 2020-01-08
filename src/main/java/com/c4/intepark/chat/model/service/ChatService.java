package com.c4.intepark.chat.model.service;

import java.util.ArrayList;

import com.c4.intepark.chat.model.vo.Chat;
import com.c4.intepark.chat.model.vo.ChatMessage;

public interface ChatService {

	int insertChat(Chat chat);
	
	int insertChatMessage(ChatMessage chatmsg);

	int selectChatNo();

	ArrayList<ChatMessage> selectMsg(int chatno);
}
