package com.c4.intepark.portfolio.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.c4.intepark.portfolio.model.service.PortfolioService;
import com.c4.intepark.portfolio.model.vo.PfList;

@Controller
public class PortfolioController {
	// 로그 처리용 객체 의존성주입 처리함 (종속객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(PortfolioController.class);

	@Autowired
	private PortfolioService portfolioService;

	public PortfolioController() {}

	@RequestMapping("conslist5.do")
	public String pfList(Model model) {
		/*
		 * ArrayList<PfList> list = new portfolioService().selectList();
		 * RequestDispatcher view = null; if (list.size() > 0) {
		 * 
		 * view = request.getRequestDispatcher("views/portfolio/portfolioListView.jsp");
		 * request.setAttribute("list", list); } else { view =
		 * request.getRequestDispatcher("views/common/error.jsp");
		 * request.setAttribute("message", "업체리스트 조회 실패!"); view.forward(request,
		 * response); }
		 */
		return "portfolio/portfolioListView";
	}

}
