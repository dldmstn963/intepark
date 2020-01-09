package com.c4.intepark.constructors.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.constructors.model.service.ConstructorsService;
import com.c4.intepark.constructors.model.vo.Constructors;

@Controller
public class ConstructorsController {

	@Autowired
	private ConstructorsService consService;

	public ConstructorsController() {
	}

	@RequestMapping("consMypage.do")
	public String consMypage() {

		return "member/consMypage";
	}

	@RequestMapping(value = "conslogCheck6.do", method = RequestMethod.POST)
	public String consLoginMethod(Constructors cons, HttpSession session, Model model) {

		Constructors loginCons = consService.loginCheck(cons);
		String view = "main";
		if (loginCons != null) {
			session.setAttribute("loginCons", loginCons);
		} else {
			model.addAttribute("message", "아이디 / 암호를 확인하여 주세요.");
			view = "member/login";
		}
		return view;

	}

	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "main";
	}

	@RequestMapping("consenroll6.do")
	public String userEnroll() {
		return "member/consEnroll";
	}

	// 관리자 시공사관리리스트.
	@RequestMapping("consList6.do")
	public String adConsList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			CommonPage cpage, Model model) {
		// 전체페이지 수찾기(검색포함)
		int listCount = 0;
		listCount = consService.selectAllListCount(cpage);
		cpage.pageUpdate(6, 10, listCount, currentPage);
		ArrayList<Constructors> albumList = consService.selectAllList(cpage);
		model.addAttribute("commonPage", cpage);
		model.addAttribute("uesrAllList", albumList);
		return "member/adminUserList";
	}

	// 관리자 1명시공사관리
	@RequestMapping("consDetailView.do")
	public String adConsDetailView(@RequestParam("consid") String consid, Model model) {

		Constructors cons = consService.selectAdConsDetail(consid);
		model.addAttribute("cons", cons);
		return "member/adminUserDetail";
	}

}
