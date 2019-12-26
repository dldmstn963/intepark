package com.c4.intepark.notice.model.controller;


import java.util.List;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.activation.CommandMap;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.c4.intepark.notice.model.service.NoticeService;
import com.c4.intepark.notice.model.vo.Notice;
import com.c4.intepark.notice.model.dao.NoticeDao;
import com.c4.intepark.notice.model.vo.NoticePage;

@Controller	//현재 클래스를 컨트롤러 빈 등록

public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	//의존관계 주입
	@Autowired
	NoticeService noticeService;
	
	public NoticeController() {}
	
	//01. 게시글 전체목록 보기
	@RequestMapping(value="nlist1.do",method=RequestMethod.GET)
	public String noticeList(Model model) {
		
		ArrayList<Notice> list = noticeService.selectAll();
		
		if (list.size() > 0) {
			model.addAttribute("list",list);
			return "notice/noticeListView";
		}else {
			model.addAttribute("message", "공지사항 목록 보기실패!");
			return "common/error";
		}
			
		}	
		
		
	//02. 게시글 상세보기
	@RequestMapping(value="ndetail2.do", method=RequestMethod.GET) 
	public ModelAndView noticeDetail(@RequestParam int noticeno, HttpSession session, ModelAndView mav)throws Exception  {
		Notice notice = noticeService.selectOne(noticeno);
		
		//조회수 증가 처리
		
		
		//전달할 뷰의 이름
		if (((List) mav).size() > 0) {
			mav.setViewName("notice/noticeDetail.jsp");
			
		}else {
			
		}
			
	return mav;	
	}
		
	//03. 게시글 검색하기 
	@RequestMapping(value="noticesearch3.do")	
	public ModelAndView noticeSearch(@RequestParam("search_option") String search) {
		ArrayList<Notice> list = noticeService.selectNoticeSearch(search);
		return null;
		
	}
		
	//04. 게시글 파일 다운 처리
	@RequestMapping(value="noticefiledown4.do",method = RequestMethod.GET)
	//get 방식으로 받기
	public ModelAndView noticeFileDown(@RequestParam(value = "noticeno") String noticeno, HttpServletRequest request) throws Exception {
		//해당 객체의 파일 천제 경로 값 받기
		Notice notice = noticeService.noticeFileDown(noticeno);
		String filePath = request.getSession().getServletContext().getRealPath("파일경로");
		//전체 경로를 인자로 넣을 파일 객체 생성
		File downFile = new File(notice.getNoticeoriginalfilename());
		File downloadFile = new File(filePath + notice.getNoticerenamefilename());
		// 생성된 객체 파일과 view들을 인자로 넣어 새 ModelAndView 객체를 생성하며 파일을 다운로드
        // (자동 rendering 해줌)
		return new ModelAndView("fileDownloadView", "downloadFile", downloadFile);
	}
		
	//05. 게시글 작성화면 이동 처리
	@RequestMapping(value="noticewrite5.do", method = RequestMethod.GET)
	public String noticeWrite() {
		
		return "notice/noticeWriteForm";
	}
	
	//06. 게시글 작성처리
	@RequestMapping(value="noticeinsert6.do", method = RequestMethod.POST)
	public String noticeInsert(@ModelAttribute Notice notice,Model model) {
		int result = noticeService.noticeInsert(notice);
		String viewFileName = "main";
		//결과 출력 조건
		if (result <= 0) {	//회원가입 실패시
			model.addAttribute("message", "공지사항 글 등록 실패!");
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	//07. 게시글 수정처리
	@RequestMapping(value="noticeupdate7.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView noticeUpdate(@RequestParam(value="idx") int idx, @ModelAttribute("notice") Notice notice ) {
		ModelAndView mv = new ModelAndView("update");
		Notice notice1 = noticeService.noticeUpdate(idx);
		
		mv.addObject("notice", notice1);
		
		return mv;
	}
	
	//08. 게시글 삭제처리
	@RequestMapping(value="noticedelete8.do",method = RequestMethod.POST)
	public void noticeDelete(@RequestParam("noticeno") int noticeno, HttpServletResponse response) throws IOException{
		int result = noticeService.noticeDelete(noticeno);
		response.setContentType("text/html charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('삭제 성공!');</script>");
		} else {
			out.println("<script>alert('삭제 실패!');</script>");
		}
	}
	
	
	
	
	
	
	
}























