package com.c4.intepark.shop.dlvylist.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dlvylistDao")
public class DlvylistDao {
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public DlvylistDao() {}
	
}
