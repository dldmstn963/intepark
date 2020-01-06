package com.c4.intepark.shop.orders.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.orders.model.service.OrdersService;
import com.c4.intepark.shop.orders.model.vo.Dlvylist;
import com.c4.intepark.shop.orders.model.vo.Orders;
import com.c4.intepark.shop.orders.model.vo.Requests;

@Controller
public class OrdersController {
	private static final Logger logger = LoggerFactory.getLogger(OrdersController.class);
	
	public OrdersController() {}
	
	@Autowired
	private OrdersService ordersService;
	
	@RequestMapping(value = "moveorderinsert4.do" , method = RequestMethod.POST)
	public String moveorderinsert(HttpServletRequest request, Orders orders) {
		logger.info("결제 창으로 이동");
		
		// 배송지 조회 페이징 처리
		Paging p = new Paging(ordersService.selectDlvylistCount(orders.getUserid()));
		p.setMemberid(orders.getUserid());
		if (request.getParameter("page") != null) {
			p.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		ArrayList<Dlvylist> list = ordersService.selectDlvyList(p);
		request.setAttribute("list", list);
		request.setAttribute("orders", orders);
		
		
		return "shopping/checkout";
	}
	
	@RequestMapping(value = "orderinsert4.do" , method = RequestMethod.POST)
	public String orderinsert(HttpServletRequest request, Dlvylist dlvylist, Requests requests,Orders orders) {
		logger.info("결제");
		logger.info("배송 정보 확인 : " + dlvylist);
		logger.info("요구사항 정보 확인 : " + requests);
		logger.info("결제 정보 확인 : " + orders);
		
		int result = ordersService.insertDlvyList(dlvylist);
		int result2 = ordersService.insertRequests(requests);
		int result3 = ordersService.insertOrders(orders);
		
		return "shopping/checkout";
	}
	
	@RequestMapping("shbasketinsert4.do")
	public String shbasketinsert4(HttpServletRequest request) {
		logger.info("장바구니 담기");
		logger.info(request.getParameter("userid"));
		logger.info(request.getParameter("goodsnum"));
		
		
		
		return "shopping/checkout";
	}
	
	
	
	
	
	
	
	
	
	
	
}
