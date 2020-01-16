package com.c4.intepark.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.c4.intepark.chat.model.service.ChatService;
import com.c4.intepark.chat.model.vo.Chat;
import com.c4.intepark.chat.model.vo.ChatMessage;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	public ChatController() {}
	
	@RequestMapping("chat3.do")
	public String moveChat(HttpServletRequest request, Model model) {
		int chatno = Integer.parseInt(request.getParameter("chatno"));
		model.addAttribute("chatno", chatno);
		return "chat/practice";
	}
	
	@RequestMapping(value = "insertChat3.do", method = RequestMethod.POST)
	@ResponseBody
	public int insertChat(Chat chat) {
		System.out.println(chat);
		int result = chatService.insertChat(chat);
		if(result > 0)
		logger.info("생성 성공");
		int chatno = chatService.selectChatNo();
		
		return chatno;
	}
	
	@RequestMapping(value ="selectMsg3.do", method=RequestMethod.POST)
	public void selectMsg(HttpServletResponse response, @RequestParam("chatno") int chatno) throws IOException {
		ArrayList<ChatMessage> list = chatService.selectMsg(chatno);
		logger.info(list.toString());
		
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(ChatMessage c :list ) {
			JSONObject job = new JSONObject();
			job.put("chatcontent", URLEncoder.encode(c.getChatcontent(), "UTF-8"));
			job.put("consid", c.getConsid());
			job.put("userid", c.getUserid());
			job.put("chattime", c.getChattime().toString());
			
			jarr.add(job);
		}
		
		sendJson.put("list", jarr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	
	  @RequestMapping(value = "insertChatMsg3.do", method = RequestMethod.POST) 
	  @ResponseBody
	  public void insertChatMsg(ChatMessage chatmsg, @RequestParam("user") String user) { 
		  
		  logger.info(chatmsg.toString());
		  logger.info(user);
		  String[] users = user.split("/");
		  if(users[0].equals("user")) {
			  chatmsg.setUserid(users[1]);
		  }else if(users[0].equals("cons")) {
			  chatmsg.setConsid(users[1]);
		  }
		  
		  int result = chatService.insertChatMessage(chatmsg);
		  if(result > 0) {
			  logger.info("성공");
		  }
	  }
	 
	
}




