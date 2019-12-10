package com.c4.intepark.shop.goods.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.c4.intepark.shop.goods.model.service.GoodsService;

@Controller
public class GoodsController {
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	public GoodsController() {}
	
	@Autowired
	private GoodsService goodsService;
	
	
}
