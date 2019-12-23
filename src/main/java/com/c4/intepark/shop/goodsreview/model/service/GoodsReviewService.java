package com.c4.intepark.shop.goodsreview.model.service;

import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goodsreview.model.vo.GoodsReview;

public interface GoodsReviewService {

	int insertGoodsReview(GoodsReview goodsreview);

	Goods selectGoods(int goodsnum);

	int updateGoodsReview(GoodsReview goodsreview);

	int deleteGoodsReview(GoodsReview goodsreview);

}
