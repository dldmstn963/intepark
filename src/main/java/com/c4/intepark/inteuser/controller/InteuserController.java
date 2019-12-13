package com.c4.intepark.inteuser.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.c4.intepark.inteuser.model.service.InteuserService;
import com.c4.intepark.inteuser.model.vo.InteUser;

@Controller
public class InteuserController {

	@Autowired
	private InteuserService userService;
	
	public InteuserController() {}
	
	@RequestMapping("userenroll6.do")
	public String userEnroll() {
		return "member/userEnroll";
	}
	
	@RequestMapping(value="userlogCheck6.do", method=RequestMethod.POST)
	public String loginCheck(InteUser inteuser, HttpSession session, Model model) {
		InteUser loginUser = userService.selectLoginCheck(inteuser);
		String view = "main";
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
		}else {
			model.addAttribute("message", "아이디 / 암호를 확인하여 주세요.");
			view = "member/login";
		}
		return view;	
	}
	
	@PostMapping("insertUser6.do")
	public String insertUser(InteUser inteuser,@RequestParam("address1") String address1,
			@RequestParam("address2") String address2,@RequestParam("address3") String address3,
			@RequestParam("address4") String address4, Model model) {
		String address= address2+" "+address3+" "+address4+" "+address1;
		inteuser.setAddress(address);
		System.out.println(inteuser);

		int result = userService.insertUser(inteuser);
		String view = "member/welcome";
		if(result != 1) {
			model.addAttribute("message", "아이디 / 암호를 확인하여 주세요.");
			view = "common.error";
		}
		return view;
	}
	//아이디 중복체크
	@RequestMapping(value="userIdchk6.do", method=RequestMethod.POST)
	public void idCheck(@RequestParam("userid") String userid, HttpServletResponse response) throws IOException {
		
		int result = userService.selectIdCheck(userid);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result != 1) 
			out.append("ok");
		else 
			out.append("dup");
		
		out.flush();
		out.close();
	}
	
	//이메일중복체크
	@RequestMapping(value="userEmailChk6.do", method=RequestMethod.POST)
	public void emailCheck(@RequestParam("useremail") String useremail, HttpServletResponse response) throws IOException {
		
		int result = userService.selectEmailCheck(useremail);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result != 1) 
			out.append("ok");
		else 
			out.append("dup");
		
		out.flush();
		out.close();
	}
}
