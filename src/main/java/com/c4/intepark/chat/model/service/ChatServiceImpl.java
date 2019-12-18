package com.c4.intepark.chat.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.chat.model.dao.ChatDao;

@Service("chatservice")
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDao chatDao;
}
