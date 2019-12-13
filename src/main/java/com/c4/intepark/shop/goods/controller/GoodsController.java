package com.c4.intepark.shop.goods.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.c4.intepark.shop.goods.model.service.GoodsService;
import com.c4.intepark.shop.goods.model.vo.Goods;

@Controller
public class GoodsController {
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	public GoodsController() {}
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("movegoodsinsert4.do")
	public String movegoodsinsert4() {
		return "shopping/cons/production/goodsinsert";
	}
	
	@RequestMapping(value="goodsinsert.do", method=RequestMethod.POST)
	public String goodsinsert(Goods goods, @RequestParam(name="file",required=false)MultipartFile file, HttpServletRequest request) {
		goods.setThumbnail("/intepark/resources/img/goodthumspic/"+ file.getOriginalFilename());
		String savePath = request.getSession().getServletContext().getRealPath("resources/img/goodthumspic");
		logger.info("상품등록 실행 : " + goods);
		try {
			int result = goodsService.insertGoods(goods);
			file.transferTo(new File(savePath + "\\" + file.getOriginalFilename()));
		}catch(Exception e){
			e.printStackTrace();
		}
		return "shopping/cons/production/goodsinsert";
	}
	
}
