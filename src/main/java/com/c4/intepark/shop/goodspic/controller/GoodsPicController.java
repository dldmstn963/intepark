package com.c4.intepark.shop.goodspic.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.c4.intepark.shop.goodspic.model.service.GoodsPicService;

@Controller
public class GoodsPicController {
	private static final Logger logger = LoggerFactory.getLogger(GoodsPicController.class);
	
	public GoodsPicController() {}
	
	@Autowired
	private GoodsPicService goodspicService;
	
	
}
