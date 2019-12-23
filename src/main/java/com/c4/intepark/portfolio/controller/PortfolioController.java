package com.c4.intepark.portfolio.controller;

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
		
		  if (list.size() > 0) {
			  model.addAttribute("list", list); 
			  return "portfolio/portfolioListView";
		  } else { 
			  model.addAttribute("message", "업체 리스트 조회 실패!");
			  return "common/error";
		  }
	}
	
	@RequestMapping("pfOne5.do")
	public ModelAndView pfOne(@RequestParam(value="consid", required=true) String consid, ModelAndView mv) {
		//logger.info(consid);
		
		Constructors cons = portfolioService.selectOneCons(consid);
		
		if(cons != null) {
			mv.addObject("cons", cons);
			mv.setViewName("portfolio/portfolioDetailView");
		}else {
			mv.addObject("message", cons.getCompanyname() + "  업체 상세 조회 실패!");
			mv.setViewName("common/error");
		}
		return mv;
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




















