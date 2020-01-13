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
import com.c4.intepark.review.model.vo.RvAvg;

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
		//logger.info(cons.getConsarea());
		
		String str = cons.getConsarea();
		String[] areas = str.split(",");
		//System.out.println("분리된 문자 : " + values.length);
		
		//for(String s : values) {
		//	System.out.println(s);
		//}
		
		if(cons != null) {
			mv.addObject("cons", cons);
			mv.addObject("areas", areas);
			mv.setViewName("request/RequestFormView");
		}else {
			mv.addObject("message", cons.getCompanyname() + "  시공사 상담신청 조회 실패!");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping(value="insertRequest5.do", method=RequestMethod.POST)
	public String insertRequest(Request req, HttpServletRequest request) {
		//logger.info(req.toString());
		String reqregion2 = request.getParameter("reqregion2");
		//logger.info(reqregion2.toString());
		if(reqregion2 != null) {
			String reqregion = req.getReqregion() + " " + reqregion2;
			req.setReqregion(reqregion);
		}
		
		int result = requestService.insertRequest(req); 
		
		return "redirect:conslist5.do";
	}
	
	@RequestMapping(value="selectRequestList5.do", method=RequestMethod.POST)
	public String selectRequestList(@RequestParam(value="consid", required=true) String consid, Model model) {
		
		Constructors cons = requestService.selectOneCons(consid);
		RvAvg rv = requestService.selectReview(consid);
		ArrayList<Request> reqlist = requestService.selectRequestList(consid);
		
		//for(int i = 0; i <reqlist.size(); i++) {
		//	String req =reqlist.get(i).getReqdate().toString().replaceAll("-", "/");
		//	reqlist.get(i).getReqdate().toString().replaceAll("-", "/");
		//	System.out.println(req);
		//}

		if(cons != null) {
			model.addAttribute("cons", cons);
			model.addAttribute("rv", rv);
			model.addAttribute("reqlist", reqlist);
			return "request/RequestListView";
		}else {
			model.addAttribute("message", cons.getCompanyname() + "  상담신청 내역 조회 실패!");
			return("common/error");
		}
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











