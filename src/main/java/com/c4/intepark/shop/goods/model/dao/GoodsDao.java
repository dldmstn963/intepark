package com.c4.intepark.shop.goods.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("goodsDao")
public class GoodsDao {
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public GoodsDao() {}
	
}
