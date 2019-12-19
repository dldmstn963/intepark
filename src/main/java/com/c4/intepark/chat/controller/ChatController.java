package com.c4.intepark.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.c4.intepark.chat.model.service.ChatService;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	public ChatController() {}
}
