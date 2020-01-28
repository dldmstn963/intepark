package com.c4.intepark.constructors.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.constructors.model.service.ConstructorsService;
import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;
import com.c4.intepark.loginInfo.model.vo.LoginMemberState;

@Controller
public class ConstructorsController {

	@Autowired
	private ConstructorsService consService;

	@RequestMapping("consenroll6.do")
	public String userEnroll() {
		return "member/consEnroll";
	}

	// 관리자 시공사관리리스트.
	@RequestMapping("admin/consList6.do")
	public String adConsList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			CommonPage cpage, Model model) {
		// 전체페이지 수찾기(검색포함)
		int listCount = 0;
		listCount = consService.selectAllListCount(cpage);
		cpage.pageUpdate(10, 10, listCount, currentPage);
		ArrayList<Constructors> consList = consService.selectAllList(cpage);
		model.addAttribute("commonPage", cpage);
		model.addAttribute("consAllList", consList);
		return "member/adminConsList";
	}

	// 관리자 1명시공사관리
	@RequestMapping("admin/consDetailView.do")
	public String adConsDetailView(@RequestParam("consid") String consid, Model model) {

		Constructors cons = consService.selectConsDetail(consid);
		ArrayList<LoginMemberState> consStopState = consService.selectConsStopState(consid);
		model.addAttribute("cons", cons);
		model.addAttribute("consStop", consStopState);
		return "member/adminConsDetail";
	}
	
	//관리자 가입승인
	@RequestMapping("admin/consApproval6.do")
	public String consApproval(@RequestParam("consid") String consid, Model model) {
		int result = consService.updateConsApproval(consid);
		if(result!=1) {
			model.addAttribute("message", "가입승인에 실패하였습니다.");
			return "/intepark/common/error";
		}
		return "redirect:/admin/consDetailView.do?consid="+consid;
	}//관리자 가입거절
	@RequestMapping("admin/consRefuse6.do")
	public String consRefuse(@RequestParam("consid") String consid, Model model) {
		int result = consService.deleteConsRefuse(consid);
		if(result!=1) {
			model.addAttribute("message", "가입거절에 실패하였습니다.");
			return "/intepark/common/error";
		}
		return "redirect:/admin/consList6.do";
	}
	//이미지 사진업로드
	@RequestMapping(value = "conProfileImgUpload.do", method = RequestMethod.POST)
	public void multiImageUpload(@RequestParam("file") MultipartFile image, @RequestParam("rename") String rename,
			HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {

		String path = request.getSession().getServletContext().getRealPath("/resources/consProfileImgs");
		if (!rename.equals("x")) {
			File file = new File(path + "\\" + rename);
			if (file.exists() == true) {
				file.delete();
			}
		}
		String originalName = image.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		// 바꿀 파일명 만들기 : 확장자는 원본과 동일하게 함.
		String renameFile = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originalName.substring(originalName.lastIndexOf(".") + 1);

		image.transferTo(new File(path + "\\" + renameFile));

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(renameFile);
		out.flush();
		out.close();
	}
	//회원가입
	@PostMapping("insertCons6.do")
	public String insertCons(Constructors cons, @RequestParam(value = "address1", required = false) String address1,
			@RequestParam(value = "address2", required = false) String address2,
			@RequestParam(value = "address3", required = false) String address3,
			@RequestParam(value = "address4", required = false) String address4, Model model) {

		if (address1 != null && address1 != "") {
			String address = address2 + " " + address3 + " " + address4 + " (" + address1 + ")";
			cons.setAddress(address);
		}
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.setLogid(cons.getConsid());
		loginInfo.setLogpwd(cons.getConspwd());
		loginInfo.setAuthority("ROLE_CONS");
		loginInfo.setEmail(cons.getConsemail());
		String view = "member/welcome";

		int result1 = consService.insertLoginId(loginInfo);
		if (result1 == 1) {
			int result2 = consService.insertCons(cons);
			if (result2 == 1) {
				return view;
			}
		}
		model.addAttribute("message", "회원가입에 실패하였습니다.");
		view = "common.error";
		return view;
	}
	
	//업데이트
		@PostMapping("consUpdate6.do")
		public String updateCons(Constructors cons, @RequestParam(value = "address1", required = false) String address1,
				@RequestParam(value = "address2", required = false) String address2,
				@RequestParam(value = "address3", required = false) String address3,
				@RequestParam(value = "address4", required = false) String address4, Model model,
				RedirectAttributes redirect) {

			if (address1 != null && address1 != "") {
				String address = address2 + " " + address3 + " " + address4 + " (" + address1 + ")";
				cons.setAddress(address);
			}
			
			int result = consService.updateCons(cons);
			if (result != 1) {
				model.addAttribute("message", "회원정보 수정에 실패하였습니다.");
				return "common/error";
			}
			redirect.addFlashAttribute("message", "회원정보 수정에 성공하였습니다.");
			return "redirect:/consMypage.do";
		}
	
	
	//마이페이지
	@RequestMapping("consMypage.do")
	public String consMypage(HttpServletRequest request, Model model) {
		String consid = ((Constructors) request.getSession().getAttribute("loginCons")).getConsid();
		Constructors cons = consService.selectConsDetail(consid);
		model.addAttribute("cons", cons);

		return "member/consMypage";
	}

}
