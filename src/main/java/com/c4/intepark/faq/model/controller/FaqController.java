package com.c4.intepark.faq.model.controller;

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

import com.c4.intepark.faq.model.vo.Faq;
import com.c4.intepark.notice.model.vo.Notice;
import com.c4.intepark.faq.model.service.FaqService;
import com.c4.intepark.faq.model.dao.FaqDao;

@Controller
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);

	//의존관계 주입
	@Autowired
	FaqService faqservice;
	
	public FaqController() {}
	
	//01. 게시글 전체목록 보기
	@RequestMapping(value="faqlist1.do",method=RequestMethod.GET)
	public String faqList(Model model) {
		
		ArrayList<Faq> list = faqservice.selectall();
		
		return null;
	}
	
	//02. 게시글 상세목록 보기
	@RequestMapping(value="faqdetail2.do",method=RequestMethod.GET)
	public ModelAndView faqDetail(@RequestParam int faqno, HttpSession session, ModelAndView mav)throws Exception{
		Faq faq = faqservice.selectOne(faqno);
		
		//조회수 증가 처리
		
		
				//전달할 뷰의 이름
				if (((List) mav).size() > 0) {
					mav.setViewName("faq/faqDetail.jsp");
					
				}else {
					
				}
					
			return mav;	
	}
	
	//03. 게시글 작성화면 이동 처리
	@RequestMapping(value="faqwrite3.do", method = RequestMethod.GET)
	public String faqWrite() {
		
		return "faq/faqWriteForm";
	}
	
	//04. 게시글 작성처리
	@RequestMapping(value="faqinsert4.do",method = RequestMethod.POST)
	public String faqInsert(@ModelAttribute Faq faq, Model model) {
		int result = faqservice.faqinsert(faq);
		
		return null;
	}
	
	//05. 게시글 수정처리
	@RequestMapping(value="faqupdate5.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView faqUpdate(@RequestParam(value="idx") int idx, @ModelAttribute("notice") Faq faq ) {
		ModelAndView mv = new ModelAndView("update");
		faq = faqservice.faqUpdate(faq);
		
		
		
		return null;
	}
	
	//06.게시글 삭제처리
	@RequestMapping(value="faqdelete6.do",method = RequestMethod.POST)
	public void noticeDelete(@RequestParam("faqno") int faqno, HttpServletResponse response) throws IOException{
		int result = faqservice.faqDelete(faqno);
		response.setContentType("text/html charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('삭제 성공!');</script>");
		} else {
			out.println("<script>alert('삭제 실패!');</script>");
		}
	}
	
	
}























