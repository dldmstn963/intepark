package com.c4.intepark.shop.goodsreview.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.c4.intepark.shop.goodsreview.model.service.GoodsReviewService;

@Controller
public class GoodsReviewController {
	private static final Logger logger = LoggerFactory.getLogger(GoodsReviewController.class);
	
	public GoodsReviewController() {}
	
	@Autowired
	private GoodsReviewService goodsreviewService;
	
	
}
