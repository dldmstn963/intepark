package com.c4.intepark.review.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
import com.c4.intepark.review.model.vo.ReviewFile;

@Controller
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(PortfolioController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	public ReviewController() {}
	
	
	@RequestMapping("selectReviewForm5.do")
	public String selectReviewForm(@RequestParam(value="consid", required=true) String consid, Model model) {
		//logger.info("아이디 : " + consid);
		
		Constructors cons = reviewService.selectReviewForm(consid);
		
		if(cons != null) {
			model.addAttribute("cons", cons);
			return "review/reviewFormView";
		}else {
			model.addAttribute("message", cons.getCompanyname() + "  시공사 리뷰작성 조회 실패!");
			return "common/error";
		}
		
	}
	
	@RequestMapping(value="insertReview5.do", method=RequestMethod.POST)
	public String insertReview(Review rv, ReviewFile rvFile, HttpServletRequest request) {
		//logger.info(review.toString());
		
		int rvkind = rv.getRvkind();
		int rvprice = rv.getRvprice();
		int rvquality = rv.getRvquality();
		int rvprofessional = rv.getRvprofessional();
		int rvresponsible = rv.getRvresponsible();
		
		double rvavg = (rvkind+rvprice+rvquality+rvprofessional+rvresponsible)/5.0;
		rv.setRvavg(rvavg);	//리뷰평균점수
		
		
		String rvperiod2 = request.getParameter("rvperiod2");	//월 값
		String rvperiod = rv.getRvperiod() + " " + rvperiod2;
		rv.setRvperiod(rvperiod);
		
		String rvregion2 = request.getParameter("rvregion2"); //구 값
		if(rvregion2 != null) {
			String rvregion = rv.getRvregion() + " " + rvregion2;
			rv.setRvregion(rvregion);
		}
		
		int result = reviewService.insertReview(rv);
		
		

		
		/*
		 * int pfnum = reviewService.selectpfnum(); portfolioFile.setPfnum(pfnum); int
		 * result2 = reviewService.insertportfolioFile(portfolioFile);
		 */
		 
		
		return "forward:pfOne5.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
