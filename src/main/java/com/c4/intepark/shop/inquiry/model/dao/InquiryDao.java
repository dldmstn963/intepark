package com.c4.intepark.shop.inquiry.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("inquiryDao")
public class InquiryDao {
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public InquiryDao() {}
	
}
