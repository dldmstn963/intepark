package com.c4.intepark.shop.inquiry.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.inquiry.model.service.InquiryService;
import com.c4.intepark.shop.inquiry.model.vo.Inquiry;

@Controller
public class InquiryController {
	private static final Logger logger = LoggerFactory.getLogger(InquiryController.class);
	
	public InquiryController() {}
	
	@Autowired
	private InquiryService inquiryService;
	
	@RequestMapping("moveinquiryinsert4.do")
	public String moveinquiryinsert4(HttpServletRequest request,@RequestParam(name = "goodsnum", required = false)int goodsnum) {
		logger.info("상품 문의창으로 이동 : " + goodsnum);
		Goods goods = inquiryService.selectGoods(goodsnum);
		request.setAttribute("goods", goods);
		return "shopping/inquiryinsert";
	}
	
	@RequestMapping("moveinquiryUpdate4.do")
	public String moveinquiryUpdate4(HttpServletRequest request,@RequestParam(name = "goodsnum", required = false)int goodsnum) {
		logger.info("상품 문의창으로 이동 : " + goodsnum);
		Goods goods = inquiryService.selectGoods(goodsnum);
		request.setAttribute("goods", goods);
		return "shopping/inquiryinsert";
	}
	
	@RequestMapping(value="goodsinquiryInsert4.do.do", method=RequestMethod.POST)
	public String goodsinquiryInsert (Inquiry goodsinquiry, HttpServletRequest request) {
		int result = inquiryService.insertGoodsInquiry(goodsinquiry);
		logger.info("리뷰 작성 완료 : " + result);
		return "redirect:moveproduct4.do?goodsnum="+goodsinquiry.getGoodsnum();
	}
	
	@RequestMapping(value="goodsinquiryUpdate4.do.do", method=RequestMethod.POST)
	public String goodsinquiryUpdate (Inquiry goodsinquiry, HttpServletRequest request) {
		int result = inquiryService.updateGoodsInquiry(goodsinquiry);
		logger.info("리뷰 작성 완료 : " + result);
		return "redirect:moveproduct4.do?goodsnum="+goodsinquiry.getGoodsnum();
	}
	
	@RequestMapping(value="goodsinquiryDelete4.do.do", method=RequestMethod.POST)
	public String goodsinquiryDelete (Inquiry goodsinquiry, HttpServletRequest request) {
		int result = inquiryService.deleteGoodsInquiry(goodsinquiry);
		logger.info("리뷰 작성 완료 : " + result);
		return "redirect:moveproduct4.do?goodsnum="+goodsinquiry.getGoodsnum();
	}
	
}
