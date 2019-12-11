package com.c4.intepark.shop.requests.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("requestsDao")
public class RequestsDao {
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public RequestsDao() {}
	
}
