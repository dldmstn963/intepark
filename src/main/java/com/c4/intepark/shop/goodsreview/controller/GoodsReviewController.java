package com.c4.intepark.shop.goodsreview.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsPic;
import com.c4.intepark.shop.goodsreview.model.service.GoodsReviewService;
import com.c4.intepark.shop.goodsreview.model.vo.GoodsReview;

@Controller
public class GoodsReviewController {
	private static final Logger logger = LoggerFactory.getLogger(GoodsReviewController.class);
	
	public GoodsReviewController() {}
	
	@Autowired
	private GoodsReviewService goodsreviewService;
	
	@RequestMapping("movereviewinsert4.do")
	public String cons(HttpServletRequest request,@RequestParam(name = "goodsnum", required = false)int goodsnum) {
		logger.info("상품 리뷰창으로 이동 : " + goodsnum);
		Goods goods = goodsreviewService.selectGoods(goodsnum);
		request.setAttribute("goods", goods);
		return "shopping/reviewinsert";
	}
	
	@RequestMapping(value="goodsReviewInsert4.do", method=RequestMethod.POST)
	public String goodsReviewInsert (GoodsReview goodsreview, HttpServletRequest request) {
		int result = goodsreviewService.insertGoodsReview(goodsreview);
		logger.info("리뷰 작성 완료 : " + result);
		return "redirect:moveproduct4.do?goodsnum="+goodsreview.getGoodsnum();
	}
	
	
	
	
	
	
	
	
	
}
