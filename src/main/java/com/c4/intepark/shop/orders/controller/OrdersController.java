package com.c4.intepark.shop.orders.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.c4.intepark.shop.goods.model.service.GoodsService;

@Controller
public class OrdersController {
	private static final Logger logger = LoggerFactory.getLogger(OrdersController.class);
	
	public OrdersController() {}
	
	@Autowired
	private GoodsService ordersService;
	
	
}
