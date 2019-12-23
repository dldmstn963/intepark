package com.c4.intepark.review.controller;

import java.util.ArrayList;

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
import com.c4.intepark.portfolio.controller.PortfolioController;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.portfolio.model.vo.PortfolioFile;
import com.c4.intepark.review.model.service.ReviewService;
import com.c4.intepark.review.model.vo.Review;

@Controller
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(PortfolioController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	public ReviewController() {}
	
	
	
	@RequestMapping("selectrvList5.do")
	public String selectrvList(Model model) {
		
		  ArrayList<Review> list = reviewService.selectrvList();
		  //logger.info(list);
		
		/*
		 * if (list.size() > 0) { model.addAttribute("list", list); return
		 * "portfolio/portfolioListView"; } else { model.addAttribute("message",
		 * "업체 리스트 조회 실패!"); return "common/error"; }
		 */
		  return null;
	}
	
	@RequestMapping("selectrvOne5.do")
	public ModelAndView selectrvOne(@RequestParam(value="rvnum", required=true) int rvnum, ModelAndView mv) {
		//logger.info(consid);
		
		Review review = reviewService.selectrvOne(rvnum);
		
		/*
		 * if(cons != null) { mv.addObject("cons", cons);
		 * mv.setViewName("portfolio/portfolioDetailView"); }else {
		 * mv.addObject("message", cons.getCompanyname() + "  업체 상세 조회 실패!");
		 * mv.setViewName("common/error"); } return mv;
		 */
		return null;
	}
	
	
	
	@RequestMapping(value="insertReview5.do", method=RequestMethod.POST)
	public String insertReview(Portfolio portfolio, PortfolioFile portfolioFile) {
		
		  int result = reviewService.insertReview(portfolio); 
		/*
		 * int pfnum = reviewService.selectpfnum(); portfolioFile.setPfnum(pfnum); int
		 * result2 = reviewService.insertportfolioFile(portfolioFile);
		 */
		 
		
		return null;
	}
	
	@RequestMapping(value="updateReview5.do", method=RequestMethod.POST)
	public String updateReview(Portfolio portfolio, PortfolioFile portfolioFile) {
		
		int result = reviewService.updateReview(portfolio);
		//int pfnum = portfolio.getPfnum();
		//int result2 = portfolioService.updateportfolioFile(pfnum);
		
		return null;
	}
	

	
	@RequestMapping(value="deleteReview5.do", method=RequestMethod.POST)
	public String deleteReview(@RequestParam(value="rvnum", required=true) int rvnum) {
		
		int result = reviewService.deleteReview(rvnum);
		
		return null;
	}
	
	
}
