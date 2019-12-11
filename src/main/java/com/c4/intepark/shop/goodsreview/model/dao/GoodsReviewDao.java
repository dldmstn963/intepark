package com.c4.intepark.shop.goodsreview.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("goodsreviewDao")
public class GoodsReviewDao {
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public GoodsReviewDao() {}
	
}
