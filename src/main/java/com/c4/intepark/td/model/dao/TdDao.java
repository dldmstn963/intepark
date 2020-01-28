package com.c4.intepark.td.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("tdDao")
public class TdDao {
	@Autowired
	private SqlSessionTemplate mybatis;
}
