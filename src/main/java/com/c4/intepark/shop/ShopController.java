package com.c4.intepark.shop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShopController {
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@RequestMapping("moveconsshop.do")
	public String cons() {
		return "shopping/cons/production/index";
	}
	
	@RequestMapping("movegoodsinsert.do")
	public String movegoodsinsert() {
		return "shopping/cons/production/plain";
	}
	
}
