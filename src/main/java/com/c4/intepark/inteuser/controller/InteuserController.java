package com.c4.intepark.inteuser.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.inteuser.model.service.InteuserService;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;
import com.c4.intepark.loginInfo.model.vo.LoginMemberState;

@Controller
public class InteuserController {

	@Autowired
	private InteuserService inteUserService;
	
	public InteuserController() {}
	
	@RequestMapping("userenroll6.do")
	public String userEnroll() {
		return "member/userEnroll";
	}
	
	@PostMapping("insertUser6.do")
	public String insertUser(InteUser inteuser, @RequestParam(value="address1", required=false) String address1,
			@RequestParam(value="address2", required=false) String address2,
			@RequestParam(value="address3", required=false) String address3,
			@RequestParam(value="address4", required=false) String address4, Model model) {
		
		if(address1 !=null && address1 !="") {
		String address= address2+" "+address3+" "+address4+" ("+address1+")";
		inteuser.setAddress(address);
		}
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.setLogid(inteuser.getUserid());
		loginInfo.setLogpwd(inteuser.getUserpwd());
		loginInfo.setAuthority("ROLE_USER");
		
		String view = "member/welcome";
		
		int result1 = inteUserService.insertLoginId(loginInfo);
		if(result1 == 1) {		
			int result2 = inteUserService.insertUser(inteuser);	
			if(result2 == 1) {
			return view;
		}
		}
			model.addAttribute("message", "회원가입에 실패하였습니다.");
			view = "common.error";
		return view;
	}
	//아이디 중복체크
	@RequestMapping(value="userIdchk6.do", method=RequestMethod.POST)
	public void idCheck(@RequestParam("userid") String userid, HttpServletResponse response) throws IOException {
		
		int result = inteUserService.selectIdCheck(userid);
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
		
		int result = inteUserService.selectEmailCheck(useremail);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result != 1) 
			out.append("ok");
		else 
			out.append("dup");
		out.flush();
		out.close();
	}
	//관리자 유저관리리스트.
	@RequestMapping("admin/userList6.do")
	public String adUserList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			CommonPage cpage, Model model) {
		// 전체페이지 수찾기(검색포함)
		int listCount = 0;
		listCount = inteUserService.selectAllListCount(cpage);
		cpage.pageUpdate(6, 10, listCount, currentPage);
		ArrayList<InteUser> userList = inteUserService.selectAllList(cpage);
		model.addAttribute("commonPage", cpage);
		model.addAttribute("uesrAllList", userList);
		return "member/adminUserList";
	}
	
	//관리자 1명유저관리
	@RequestMapping("admin/userDetailView.do")
	public String adUserDetailView(@RequestParam("userid") String userid, Model model) {
		
		InteUser inteuser = inteUserService.selectUserDetail(userid);
		ArrayList<LoginMemberState> userStopState = inteUserService.selectUserStopState(userid);
		model.addAttribute("inteUser", inteuser);
		model.addAttribute("userStop", userStopState);
		return "member/adminUserDetail";
	}

	
	//아이디비번찾기 이동
	@RequestMapping("userFindIdPwd.do")
	public String userFindIdpwd() {
		return "member/userFindIdPwd";
	}
	
	//유저 마이페이지
	@RequestMapping("userMypage.do")
	public String userMypage(HttpServletRequest request, Model model) {
		String userid = ((InteUser)request.getSession().getAttribute("loginUser")).getUserid();
		InteUser inteuser = inteUserService.selectUserDetail(userid);
		model.addAttribute("inteUser", inteuser);
		return "member/userMypage";
	}
	
	//유저 업데이트
	@RequestMapping(value="userUpdate6.do", method=RequestMethod.POST)
	public String userUpdate(InteUser inteuser, @RequestParam(value="address1", required=false) String address1,
			@RequestParam(value="address2", required=false) String address2,
			@RequestParam(value="address3", required=false) String address3,
			@RequestParam(value="address4", required=false) String address4, Model model,
			RedirectAttributes redirect) {
		
		if(address1 !=null && address1 !="") {
		String address= address2+" "+address3+" "+address4+" ("+address1+")";
		inteuser.setAddress(address);
		}
		
		int result = inteUserService.updateUser(inteuser);
		if(result !=1) {
			model.addAttribute("message", "회원정보 수정에 실패하였습니다.");
			return "common/error";
		}
		redirect.addFlashAttribute("message", "회원정보 수정에 성공하였습니다.");
		return "redirect:/userMypage.do";
		
	}
	
	//유저 비밀번호 변경체크
	@RequestMapping(value="userUpPwdCheck.do", method=RequestMethod.POST)
	public void userUpPwdCheck(LoginInfo loginfo, 
			HttpServletResponse response) throws IOException {
		
		int result = inteUserService.selectUserPwdCheck(loginfo);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result == 1) 
			out.append("ok");
		else 
			out.append("no");
		out.flush();
		out.close();
		
	}
	
	//유저 비밀번호 변경
	@RequestMapping(value="userUpdatePwd.do", method=RequestMethod.POST)
	public String userUpdatePwd(LoginInfo loginfo, Model model, RedirectAttributes redirect) {
		
		int result = inteUserService.updateUserPwd(loginfo);
		redirect.addFlashAttribute("message", "비밀번호 변경에 성공하였습니다.");
		if(result !=1) {
			model.addAttribute("message", "비밀번호 변경에 실패하였습니다.");
			return "common/error";
		}
		return "redirect:/userMypage.do";
	}
	//유저 탈퇴
	@RequestMapping(value="userWithdraw.do", method=RequestMethod.POST)
	public String deleteUser(LoginMemberState logms, Model model, RedirectAttributes redirect) {
		
		int result = inteUserService.updateDeleteUser(logms);
		if(result !=1) {
			model.addAttribute("message", "탈퇴에 실패하였습니다.");
			return "common/error";
		}
		return "redirect:/logout";
		
	}
}









