package com.c4.intepark.request.controller;

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
import com.c4.intepark.request.model.service.RequestService;
import com.c4.intepark.request.model.vo.Request;

@Controller
public class RequestController {
	private static final Logger logger = LoggerFactory.getLogger(RequestController.class);

	@Autowired
	private RequestService requestService;

	public RequestController() {}
	
	@RequestMapping(value="selectRequestForm5.do", method=RequestMethod.POST)
	public ModelAndView selectRequestForm(@RequestParam(value="consid", required=true) String consid, ModelAndView mv) {
		//logger.info(consid);
		
		Constructors cons = requestService.selectRequestForm(consid);
		
		if(cons != null) {
			mv.addObject("cons", cons);
			mv.setViewName("portfolio/portfolioRequestView");
		}else {
			mv.addObject("message", cons.getCompanyname() + "  시공사 상담신청 조회 실패!");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	
	@RequestMapping(value="insertRequest5.do", method=RequestMethod.POST)
	public String insertRequest(Request req, HttpServletRequest request) {
		logger.info(req.toString());
		String reqregion2 = request.getParameter("reqregion2");
		logger.info(reqregion2.toString());
		
		int result = requestService.insertRequest(req); 
		
		return "redirect:conslist5.do";
	}
	
	@RequestMapping(value="selectReqConsList5.do", method=RequestMethod.POST)
	public String selectReqConsList(@RequestParam(value="consid", required=true) String consid, HttpServletRequest request) {
		
		ArrayList<Request> list = requestService.selectReqConsList(consid);
		
		request.setAttribute("list", list);
		return "aa";
	}
	
	@RequestMapping(value="updateRequest5.do", method=RequestMethod.POST)
	public String updateRequest(Request req, HttpServletRequest request) {
		
		int result = requestService.updateRequest(req);
		
		return "aa";
	}
	
	@RequestMapping(value="deleteRequest5.do", method=RequestMethod.POST)
	public String deleteRequest(@RequestParam(value="reqnum", required=true) String reqnum) {
		
		int result = requestService.deleteRequest(reqnum);
		
		return "aa";
	}
}











