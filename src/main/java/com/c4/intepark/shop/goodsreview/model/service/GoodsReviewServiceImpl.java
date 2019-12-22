package com.c4.intepark.shop.goodsreview.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goodsreview.model.dao.GoodsReviewDao;
import com.c4.intepark.shop.goodsreview.model.vo.GoodsReview;

@Service("goodsreviewService")
public class GoodsReviewServiceImpl implements GoodsReviewService{
	
	@Autowired
	private GoodsReviewDao goodsreviewDao;

	@Override
	public int insertGoodsReview(GoodsReview goodsreview) {
		return goodsreviewDao.insertGoodsReview(goodsreview);
	}

	@Override
	public Goods selectGoods(int goodsnum) {
		return goodsreviewDao.selectGoods(goodsnum);
	}
	
	
}
