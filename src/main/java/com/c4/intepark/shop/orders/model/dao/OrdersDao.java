package com.c4.intepark.shop.orders.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ordersDao")
public class OrdersDao {
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public OrdersDao() {}
	
}
