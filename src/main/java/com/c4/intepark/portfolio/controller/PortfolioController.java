package com.c4.intepark.portfolio.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.portfolio.model.service.PortfolioService;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.portfolio.model.vo.PortfolioFile;
import com.c4.intepark.request.model.vo.Request;
import com.c4.intepark.review.model.vo.Review;
import com.c4.intepark.review.model.vo.RvAvg;

@Controller
public class PortfolioController {
	// 로그 처리용 객체 의존성주입 처리함 (종속객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(PortfolioController.class);

	@Autowired
	private PortfolioService portfolioService;

	public PortfolioController() {}

	@RequestMapping("conslist5.do")
	public String pfList(Model model) {
		
		  ArrayList<Constructors> list = portfolioService.selectList();
		  //logger.info(list);
		  ArrayList<RvAvg> rv = portfolioService.selectAllReview();
		  
		  if (list.size() > 0) {
			  model.addAttribute("list", list);
			  model.addAttribute("rv", rv);
			  return "portfolio/portfolioListView";
		  } else { 
			  model.addAttribute("message", "시공사 리스트 조회 실패!");
			  return "common/error";
		  }
	}
	
	@RequestMapping("pfOne5.do")
	public ModelAndView pfOne(@RequestParam(value="consid", required=true) String consid, ModelAndView mv) {
		//logger.info(consid);
		
		Constructors cons = portfolioService.selectOneCons(consid);
		RvAvg rv = portfolioService.selectReview(consid);
		ArrayList<Review> review = portfolioService.selectConsReviewList(consid);
	
		if(cons != null) {
			mv.addObject("cons", cons);
			mv.addObject("rv", rv);
			mv.addObject("review", review);
			mv.setViewName("portfolio/portfolioDetailView");
		}else {
			mv.addObject("message", cons.getCompanyname() + "  시공사 상세 조회 실패!");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping(value="writeIntroductionForm5.do", method=RequestMethod.POST)
	public String writeIntroductionForm(@RequestParam(value="consid", required=true) String consid, Model model) {
		//System.out.println("출력이다 : " + consid);
		
		Constructors cons = portfolioService.selectOneCons(consid);
		RvAvg rv = portfolioService.selectReview(consid);
		ArrayList<Review> review = portfolioService.selectConsReviewList(consid);	//생략가능
		
		 if (cons != null) {
			 model.addAttribute("cons", cons);
			 model.addAttribute("rv", rv);
			 model.addAttribute("review", review);	//생략가능
			 return "portfolio/writeIntroduction";
		  } else { 
			 model.addAttribute("message", "소개글 작성페이지 조회 실패!");
			 return "common/error";
		  }	
	}
	
	@RequestMapping(value="updateIntroduction5.do", method=RequestMethod.POST)
	public String updateIntroduction(@RequestParam(value="consid", required=true) String consid, HttpServletRequest request, Model model) {
		String pfintroduction = request.getParameter("ir1");
		//logger.info("스마트에디터다 : " + pfintroduction );
		
		Constructors cons = new Constructors();
		cons.setConsid(consid);
		cons.setPfintroduction(pfintroduction);
		
		int result = portfolioService.updateIntroduction(cons);
		
		if (result > 0) {
			 return "forward:pfOne5.do";
		  } else { 
			 model.addAttribute("message", "소개글 작성 실패!");
			 return "common/error";
		  }	
	}
	
	@RequestMapping(value="test5.do", method=RequestMethod.POST)
	public String test5() {
		return "review/test";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="insertpf5.do", method=RequestMethod.POST)
	public String insertportfolio(Portfolio portfolio, PortfolioFile portfolioFile) {
		
		int result = portfolioService.insertportfolio(portfolio);
		int pfnum = portfolioService.selectpfnum();
		portfolioFile.setPfnum(pfnum);
		int result2 = portfolioService.insertportfolioFile(portfolioFile);
		
		return null;
	}
	
	@RequestMapping(value="updatepf5.do", method=RequestMethod.POST)
	public String updateportfolio(Portfolio portfolio, PortfolioFile portfolioFile) {
		
		int result = portfolioService.updateportfolio(portfolio);
		int pfnum = portfolio.getPfnum();
		//int result2 = portfolioService.updateportfolioFile(pfnum);
		
		return null;
	}
	

	
	@RequestMapping(value="deletepf5.do", method=RequestMethod.POST)
	public String deleteportfolio(@RequestParam(value="reqnum", required=true) String reqnum) {
		
		int result = portfolioService.deleteportfolio(reqnum);
		
		return null;
	}
	
	
}




















