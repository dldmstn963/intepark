package com.c4.intepark.shop.goodsreview.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.shop.goodsreview.model.dao.GoodsReviewDao;

@Service("goodsreviewService")
public class GoodsReviewServiceImpl implements GoodsReviewService{
	
	@Autowired
	private GoodsReviewDao goodsreviewDao;
	
	
}
