package com.c4.intepark.shop.orders.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.c4.intepark.shop.goods.model.service.GoodsService;
import com.c4.intepark.shop.orders.model.vo.Orders;

@Controller
public class OrdersController {
	private static final Logger logger = LoggerFactory.getLogger(OrdersController.class);
	
	public OrdersController() {}
	
	@Autowired
	private GoodsService ordersService;
	
	@RequestMapping(value = "orderinsert4.do" , method = RequestMethod.POST)
	public String orderinsert(HttpServletRequest request, Orders orders) {
		System.out.println("Dddddddd" + orders);
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
