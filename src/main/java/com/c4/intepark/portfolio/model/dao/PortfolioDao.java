package com.c4.intepark.portfolio.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.portfolio.model.vo.PfList;

@Repository("portfolioDao")
public class PortfolioDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public PortfolioDao() {}

	public ArrayList<PfList> selectList() {
		List<PfList> list = mybatisSession.selectList("portfolioMapper.selectList");
		return (ArrayList<PfList>)list;
	}
	
	
}
