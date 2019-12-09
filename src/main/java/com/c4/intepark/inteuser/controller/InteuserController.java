package com.c4.intepark.inteuser.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.c4.intepark.inteuser.model.service.InteuserService;
import com.c4.intepark.inteuser.model.vo.InteUser;

@Controller
public class InteuserController {

	@Autowired
	private InteuserService userService;
	
	public InteuserController() {}
	
	@RequestMapping(value="userlogCheck6.do", method=RequestMethod.POST)
	public String loginCheck(InteUser inteuser, HttpSession session, Model model) {
		InteUser loginUser = userService.loginCheck(inteuser);
		String view = "main";
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
		}else {
			model.addAttribute("message", "아이디 / 암호를 확인하여 주세요.");
			view = "member/login";
		}
		return view;	
	}
}
