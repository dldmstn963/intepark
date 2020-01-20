package com.c4.intepark.loginInfo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.c4.intepark.common.CommonMailSending;
import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.loginInfo.model.service.LoginInfoService;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;
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

		if (request.getAttribute("error") != null) {
			String error = (String) request.getAttribute("error");
			if (error.equals("정지")) {
				System.out.println((String) request.getAttribute("logid"));
				LoginMemberState logState = logService.selectMemberState((String) request.getAttribute("logid"));
				if (logState.getMemberstate().equals("탈퇴")) {
					model.addAttribute("error2", "탈퇴된 회원입니다.");
				} else {
					model.addAttribute("error3", "정지된 회원입니다.");
					model.addAttribute("error4", "사유 :" + logState.getStopcause());
					model.addAttribute("error5",
							"기간 : " + logState.getStopstartdate() + " ~ " + logState.getStopfinishdate());
				}
			} else {
				model.addAttribute("error1", request.getAttribute("error"));
			}
		}
		return "member/login";
	}

	@RequestMapping("loginSuccess.do")
	public String loginSuccess(HttpServletRequest request, Model model) {
		LoginInfo log = (LoginInfo)SecurityContextHolder.getContext().getAuthentication().getDetails();
		HttpSession session = request.getSession(false);
		
		if (log.getAuthority().trim().equals("ROLE_CONS")) {
			Constructors loginCons = logService.selectConsSession(request.getUserPrincipal().getName());
			session.setAttribute("loginCons", loginCons);
		} else {
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

	// 아이디 중복체크
	@RequestMapping(value = "idchk6.do", method = RequestMethod.POST)
	public void idCheck(@RequestParam("logid") String logid, HttpServletResponse response) throws IOException {

		int result = logService.selectIdCheck(logid);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result != 1)
			out.append("ok");
		else
			out.append("dup");

		out.flush();
		out.close();
	}

	// 이메일중복체크
	@RequestMapping(value = "emailChk6.do", method = RequestMethod.POST)
	public void emailCheck(@RequestParam("logemail") String logemail, HttpServletResponse response) throws IOException {

		int result = logService.selectEmailCheck(logemail);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result != 1)
			out.append("ok");
		else
			out.append("dup");
		out.flush();
		out.close();
	}

	// 아이디비번찾기 이동
	@RequestMapping("userFindIdPwd.do")
	public String userFindIdpwd() {
		return "member/userFindIdPwd";
	}

	@RequestMapping("consFindIdPwd.do")
	public String consFindIdPwd() {
		return "member/consFindIdPwd";
	}

	// 고객아이디 찾기
	@RequestMapping("findUserId.do")
	public String findUserId(InteUser inteuser, RedirectAttributes redirect) {
		String userid = logService.selectFindUserId(inteuser);
		if (userid.equals("없음")) {
			redirect.addFlashAttribute("message", "이름/이메일이 일치하지 않습니다");
		} else {
			CommonMailSending cms = new CommonMailSending();
			try {
				cms.mailSending(inteuser.getUseremail(), inteuser.getUsername(), userid);
			} catch (Exception e) {
				e.printStackTrace();
			}
			redirect.addFlashAttribute("message", "아이디 찾기에 성공하였습니다. 이메일을 확인해주세요");
		}
		return "redirect:/userFindIdPwd.do";
	}

	// 시공사 아이디 찾기
	@RequestMapping("findConsId.do")
	public String findConsId(Constructors cons, RedirectAttributes redirect) {
		String consid = logService.selectFindConsId(cons);
		if (consid.equals("없음")) {
			redirect.addFlashAttribute("message", "이름/이메일이 일치하지 않습니다");
		} else {
			CommonMailSending cms = new CommonMailSending();
			try {
				cms.mailSending(cons.getConsemail(), cons.getConsname(), consid);
			} catch (Exception e) {
				e.printStackTrace();
			}
			redirect.addFlashAttribute("message", "아이디 찾기에 성공하였습니다. 이메일을 확인해주세요");
		}
		return "redirect:/consFindIdPwd.do";
	}

	// 비밀번호 찾기
	@RequestMapping("findPwd.do")
	public String findUserPwd(LoginInfo loginfo, RedirectAttributes redirect) {
		// 아이디 이메일이 들어와서 조회한후 없으면 에러
		// 있으면 비밀번호 난수생성후 업데이트하고 비번보내줌.
		int result = logService.selectFindUserPwd(loginfo);
		if (result != 1) {
			redirect.addFlashAttribute("message", "아이디/이메일이 일치하지 않습니다");
		} else {
			String uuid = "";
			for (int i = 0; i < 5; i++) {
				uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다.
				uuid = uuid.substring(0, 10); // uuid를 앞에서부터 10자리 잘라줌.
			}
			loginfo.setLogpwd(uuid);
			logService.updateNewLogPwd(loginfo);
			CommonMailSending cms = new CommonMailSending();
			try {
				cms.mailSending2(loginfo.getEmail(), loginfo.getLogid(), loginfo.getLogpwd());
			} catch (Exception e) {
				e.printStackTrace();
			}
			redirect.addFlashAttribute("message", "임시비밀번호 발행에 성공하였습니다. 이메일을 확인해주세요");
		}
		return "redirect:/userFindIdPwd.do";
	}

}