package com.c4.intepark.point.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("pointDao")
public class PointDao {
	@Autowired
	private SqlSessionTemplate mybatisSession;

}
