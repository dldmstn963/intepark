package com.c4.intepark.portfolio.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.constructors.model.vo.Constructors;

@Repository("portfolioDao")
public class PortfolioDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public PortfolioDao() {}

	public ArrayList<Constructors> selectList() {
		List<Constructors> list = mybatisSession.selectList("portfolioMapper.selectList");
		return (ArrayList<Constructors>)list;
	}
	
	
}
