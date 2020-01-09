package com.c4.intepark.member.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.c4.intepark.member.model.service.MemberService;
import com.c4.intepark.member.model.vo.User;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	
	
	
	@RequestMapping("userManagement6.do")
	public String userManagementList() {
		
		return "member/userManagementList";
	}
	
	@RequestMapping("consManagement6.do")
	public String consManagement() {
		return "member/consManagement";
	}

}
