package com.c4.intepark.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.chat.model.vo.Chat;
import com.c4.intepark.chat.model.vo.ChatMessage;

@Repository("chatDao")
public class ChatDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public ChatDao() {}

	public int insertChat(Chat chat) {
		return session.update("chatMapper.insertChat", chat);
	}

	public int insertChatMessage(ChatMessage chatmsg) {
		return session.update("chatMapper.insertChatMessage", chatmsg);
	}

	public int selectChatNo() {
		return session.selectOne("chatMapper.selectChatNo");
	}

	public ArrayList<ChatMessage> selectMsg(int chatno) {
		List<ChatMessage> list = session.selectList("chatMapper.selectChatMsg", chatno);
		return (ArrayList<ChatMessage>)list;
	}
}
