package com.c4.intepark.shop.goodspic.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("goodspicDao")
public class GoodsPicDao {
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public GoodsPicDao() {}
	
}
