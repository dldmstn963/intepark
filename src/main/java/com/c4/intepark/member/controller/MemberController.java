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
	
	
	@RequestMapping("stopUser6.do")
	public String stopUser() {	
		return "member/adminStopUser";
	}
	
	@RequestMapping("dropUser6.do")
	public String dropUser() {	
		return "member/adminDropUser";
	}
	
	@RequestMapping("consList6.do")
	public String consList() {	
		return "member/adminConsList";
	}
	
	@RequestMapping("enrollCons6.do")
	public String enrollCons() {	
		return "member/adminEnrollCons";
	}
	
	@RequestMapping("stopCons6.do")
	public String stopCons() {	
		return "member/adminStopCons";
	}
	
	@RequestMapping("dropCons6.do")
	public String dropCons() {	
		return "member/adminDropCons";
	}
	
	
	
	@RequestMapping("userManagement6.do")
	public String userManagementList() {
		
		return "member/userManagementList";
	}
	
	@RequestMapping("consManagement6.do")
	public String consManagement() {
		return "member/consManagement";
	}

}
