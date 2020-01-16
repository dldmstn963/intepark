package com.c4.intepark.loginInfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.loginInfo.model.service.LoginInfoService;
import com.c4.intepark.loginInfo.model.vo.LoginMemberState;

@Controller
public class LoginInfoController {
	
	@Autowired
	private LoginInfoService logService;
	
	@RequestMapping("/accessError.do")
	public String errorPage(Authentication auth, Model model) {
		model.addAttribute("message", "접근 하실 수 없는 페이지입니다.");
		return "common/error";
	}
	@RequestMapping("login6.do")
	public String loginInput(HttpServletRequest request, Model model) {
		
		if(request.getAttribute("error") !=null) {
			String error = (String)request.getAttribute("error");
			if(error.equals("정지")) {
				System.out.println((String)request.getAttribute("logid"));
				LoginMemberState logState = logService.selectMemberState((String)request.getAttribute("logid"));
				if(logState.getMemberstate().equals("탈퇴")) {
					model.addAttribute("error2", "탈퇴된 회원입니다.");
				}else {
					model.addAttribute("error3", "정지된 회원입니다.");
					model.addAttribute("error4", "사유 :"+logState.getStopcause());
					model.addAttribute("error5", "기간 : "+logState.getStopstartdate()+" ~ "+logState.getStopfinishdate());
				}	
			}else {
				model.addAttribute("error1", request.getAttribute("error"));
			}
		}
		return "member/login";
	}
	
	@RequestMapping("loginSuccess.do")
	public String loginSuccess(HttpServletRequest request, HttpSession session, Model model) {
		
		if(request.isUserInRole("ROLE_CONS")){
			Constructors loginCons = logService.selectConsSession(request.getUserPrincipal().getName());
				session.setAttribute("loginCons", loginCons);
		}else {
			InteUser loginUser = logService.selectUserSession(request.getUserPrincipal().getName());
				session.setAttribute("loginUser", loginUser);

		}
		return "redirect:/main.do";
	}
	
	@RequestMapping("lout.do")
	public String doubleloginOut(Model model) {
		model.addAttribute("log", "세션이 끊겼습니다. 다시 로그인해주세요.");
		return "main";

	}
	
	@RequestMapping("doubleLogin.do")
	public String dobuleloginIn(Model model) {
		model.addAttribute("log", "중복 로그인으로 접속을 해제합니다.");
		return "main";

	}

}
