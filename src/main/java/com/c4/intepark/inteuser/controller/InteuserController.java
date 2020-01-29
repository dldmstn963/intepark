package com.c4.intepark.inteuser.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.common.KakaoLogin;
import com.c4.intepark.inteuser.model.service.InteuserService;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;
import com.c4.intepark.loginInfo.model.vo.LoginMemberState;

@Controller
public class InteuserController {

	@Autowired
	private InteuserService inteUserService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	public InteuserController() {
	}

	@RequestMapping("userenroll6.do")
	public String userEnroll() {
		return "member/userEnroll";
	}
	//회원가입
	@PostMapping("insertUser6.do")
	public String insertUser(InteUser inteuser, @RequestParam(value = "address1", required = false) String address1,
			@RequestParam(value = "address2", required = false) String address2,
			@RequestParam(value = "address3", required = false) String address3,
			@RequestParam(value = "address4", required = false) String address4, Model model) {

		if (address1 != null && address1 != "") {
			String address = address2 + " " + address3 + " " + address4 + " (" + address1 + ")";
			inteuser.setAddress(address);
		}
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.setLogid(inteuser.getUserid());
		loginInfo.setLogpwd(bcryptPasswordEncoder.encode(inteuser.getUserpwd()));
		loginInfo.setAuthority("ROLE_USER");
		loginInfo.setEmail(inteuser.getUseremail());
		String view = "member/welcome";

		int result1 = inteUserService.insertLoginId(loginInfo);
		if (result1 == 1) {
			int result2 = inteUserService.insertUser(inteuser);
			if (result2 == 1) {
				return view;
			}
		}
		model.addAttribute("message", "회원가입에 실패하였습니다.");
		view = "common.error";
		return view;
	}
	
	//카카오로 로그인
	@RequestMapping(value = "/kakaoLogin.do", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code,HttpServletRequest request,RedirectAttributes redirect) {
		System.out.println(code);
		KakaoLogin kl = new KakaoLogin();
		String accessToken = kl.getAccessToken(code);
		HashMap<String, Object> userInfo = kl.getUserInfo(accessToken);
		String logid = userInfo.get("userid").toString();
		String username = userInfo.get("nickname").toString();
		String useremail = userInfo.get("email").toString();
		

		int idcheck = inteUserService.selectIdCheck(logid);
		if(idcheck!=1) {//비회원 회원가입함.
			LoginInfo loginInfo = new LoginInfo();
			loginInfo.setLogid(logid);
			String userpwd = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10); // -를 제거해 주었다.
			loginInfo.setLogpwd(userpwd);
			loginInfo.setAuthority("ROLE_USER");
			loginInfo.setEmail(useremail);
			
			int result1 = inteUserService.insertLoginId(loginInfo);
			if (result1 == 1) {//유저정보입력함
				InteUser inteuser = new InteUser();
				inteuser.setUserid(logid);
				inteuser.setUseremail(useremail);
				inteuser.setUsername(username);
				
				inteUserService.insertUser(inteuser);
			}
		}//회원가입후 바로 로그인으로 ..
		HttpSession session = request.getSession(false);
		InteUser loginUser = inteUserService.selectUserSession(logid);
		session.setAttribute("loginUser", loginUser);
		
		return "main";
	}

	// 관리자 유저관리리스트.
	@RequestMapping("admin/userList6.do")
	public String adUserList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			CommonPage cpage, Model model) {
		// 전체페이지 수찾기(검색포함)
		int listCount = 0;
		listCount = inteUserService.selectAllListCount(cpage);
		cpage.pageUpdate(10, 10, listCount, currentPage);
		ArrayList<InteUser> userList = inteUserService.selectAllList(cpage);
		model.addAttribute("commonPage", cpage);
		model.addAttribute("uesrAllList", userList);
		return "member/adminUserList";
	}

	// 관리자 1명유저관리
	@RequestMapping("admin/userDetailView.do")
	public String adUserDetailView(@RequestParam("userid") String userid, Model model) {

		InteUser inteuser = inteUserService.selectUserDetail(userid);
		ArrayList<LoginMemberState> userStopState = inteUserService.selectUserStopState(userid);
		model.addAttribute("inteUser", inteuser);
		model.addAttribute("userStop", userStopState);
		return "member/adminUserDetail";
	}
	// 유저 마이페이지
	@RequestMapping("userMypage.do")
	public String userMypage(HttpServletRequest request, Model model) {
		String userid = ((InteUser) request.getSession().getAttribute("loginUser")).getUserid();
		InteUser inteuser = inteUserService.selectUserDetail(userid);
		model.addAttribute("inteUser", inteuser);
		return "member/userMypage";
	}

	// 유저 업데이트
	@RequestMapping(value = "userUpdate6.do", method = RequestMethod.POST)
	public String userUpdate(InteUser inteuser, @RequestParam(value = "address1", required = false) String address1,
			@RequestParam(value = "address2", required = false) String address2,
			@RequestParam(value = "address3", required = false) String address3,
			@RequestParam(value = "address4", required = false) String address4, Model model,
			RedirectAttributes redirect) {

		if (address1 != null && address1 != "") {
			String address = address2 + " " + address3 + " " + address4 + " (" + address1 + ")";
			inteuser.setAddress(address);
		}

		int result = inteUserService.updateUser(inteuser);
		if (result != 1) {
			model.addAttribute("message", "회원정보 수정에 실패하였습니다.");
			return "common/error";
		}
		redirect.addFlashAttribute("message", "회원정보 수정에 성공하였습니다.");
		return "redirect:/userMypage.do";

	}
}
