package com.c4.intepark.chat.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.chat.model.dao.ChatDao;
import com.c4.intepark.chat.model.vo.Chat;
import com.c4.intepark.chat.model.vo.ChatMessage;

@Service("chatservice")
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDao chatDao;

	@Override
	public int insertChat(Chat chat) {
		return chatDao.insertChat(chat);
	}

	@Override
	public int insertChatMessage(ChatMessage chatmsg) {
		return chatDao.insertChatMessage(chatmsg);
	}

	@Override
	public int selectChatNo() {
		return chatDao.selectChatNo();
	}

	@Override
	public ArrayList<ChatMessage> selectMsg(int chatno) {
		return chatDao.selectMsg(chatno);
	}
}
