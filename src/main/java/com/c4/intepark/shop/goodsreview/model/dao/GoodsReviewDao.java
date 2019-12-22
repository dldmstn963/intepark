package com.c4.intepark.shop.goodsreview.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goodsreview.model.vo.GoodsReview;

@Repository("goodsreviewDao")
public class GoodsReviewDao {
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public GoodsReviewDao() {}

	public int insertGoodsReview(GoodsReview goodsreview) {
		return mybatis.insert("goodsReviewmapper.insertGoodsReview",goodsreview);
	}

	public Goods selectGoods(int goodsnum) {
		return mybatis.selectOne("goodsMapper.selectGoods",goodsnum);
	}
	
}
