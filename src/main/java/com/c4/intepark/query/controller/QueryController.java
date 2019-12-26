package com.c4.intepark.query.controller;

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

import com.c4.intepark.query.model.vo.Query;
import com.c4.intepark.query.model.service.QueryService;
import com.c4.intepark.notice.model.controller.NoticeController;
import com.c4.intepark.query.model.dao.QueryDao;

@Controller
public class QueryController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	// 의존관계주입
	@Autowired
	QueryService queryService;

	public QueryController() {
	}

	// 01. 1대1문의 전체목록보기
	@RequestMapping(value = "querylist1.do", method = RequestMethod.GET)
	public String querylist(Model model) {
		ArrayList<Query> list = queryService.selectAll();

		if (list.size() > 0) {
			model.addAttribute("list", list);
			return "query/queryListView";
		} else {
			model.addAttribute("message", "1대1문의 목록 보기실패!");
			return "common/error";
		}
	}

	// 02. 1대1문의 상세보기
	@RequestMapping(value = "querydetail2.do", method = RequestMethod.GET)
	public ModelAndView queryDetail(@RequestParam int queryno, HttpSession session, ModelAndView mav) throws Exception {
		Query query = queryService.selectOne(queryno);

		return mav;
	}

	// 03. 게시글 검색하기
	@RequestMapping(value = "querysearch3.do")
	public ModelAndView querySearch(@RequestParam("search_option") String search) {
		ArrayList<Query> list = queryService.querySearch(search);
		return null;
	}

	// 04. 게시글 작성화면 이동처리
	@RequestMapping(value = "querywrite4.do", method = RequestMethod.GET)
	public String queryWrite() {

		return "query/queryWirteFrom";
	}

	// 05. 게시글 작성처리
	@RequestMapping(value = "queryinsert5.do", method = RequestMethod.POST)
	public String queryInsert(@ModelAttribute Query query, Model model) {
		int result = queryService.queryinsert(query);
		String viewFileName = "main";
		// 결과 출력 조건
		if (result <= 0) { // 회원가입 실패시
			model.addAttribute("message", "공지사항 글 등록 실패!");
			viewFileName = "common/error";
		}

		return viewFileName;
	}

	// 06. 게시글 수청처리
	@RequestMapping(value = "queryupdate6.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView queryUpdate(@RequestParam(value = "idx") int idx, @ModelAttribute("query") Query query) {
		ModelAndView mv = new ModelAndView("update");
		Query query1 = queryService.queryUpdate(idx);

		mv.addObject("query", query1);
		return mv;
	}

	// 07. 게시글 삭제처리
	@RequestMapping(value = "querydelete7.do", method = RequestMethod.POST)
	public void queryDelete(@RequestParam("queryno") int queryno, HttpServletResponse response) throws IOException {
		int result = queryService.queryDelete(queryno);
		response.setContentType("text/html charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('삭제 성공!');</script>");
		} else {
			out.println("<script>alert('삭제 실패!');</script>");
		}
	}

	 //08. 게시글 뎃글작성
	  
	  @RequestMapping(value="queryreplyinsert8.do",method = RequestMethod.POST)
	  public int insertqueryreply(@ModelAttribute Query query, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 댓글 등록 처리용 컨트롤러
			//1.
			request.setCharacterEncoding("utf-8");
			
			//2.
			//댓글의 원글 번호
			int boardNum = Integer.parseInt(request.getParameter("bnum"));
			//댓글 정보 추출
			String replyTitle = request.getParameter("rtitle");
			String replyWriter = request.getParameter("rwriter");
			String replyContent = request.getParameter("rcontent");
			
		
			
			//3.
			int result = queryService.insertqueryreply(query);
			
			
		  return 0;
	  }
	

}

























