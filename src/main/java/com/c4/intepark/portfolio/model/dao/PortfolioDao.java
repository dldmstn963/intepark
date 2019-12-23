package com.c4.intepark.portfolio.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.portfolio.model.vo.PortfolioFile;

@Repository("portfolioDao")
public class PortfolioDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public PortfolioDao() {}

	public ArrayList<Constructors> selectList() {
		List<Constructors> list = mybatisSession.selectList("portfolioMapper.selectList");
		return (ArrayList<Constructors>)list;
	}
	
	public Constructors selectOneCons(String consid) {
		return mybatisSession.selectOne("portfolioMapper.selectOneCons", consid);
	}

	public int insertportfolio(Portfolio portfolio) {
		return mybatisSession.insert("portfolioMapper.insertportfolio", portfolio);
	}

	public int selectpfnum() {
		return mybatisSession.selectOne("portfolioMapper.selectpfnum");
	}

	public int insertportfolioFile(PortfolioFile portfolioFile) {
		return mybatisSession.insert("portfolioMapper.insertportfolioFile", portfolioFile);
	}

	public int updateportfolio(Portfolio portfolio) {
		return mybatisSession.update("portfolioMapper.updateportfolio", portfolio);
	}

	public int deleteportfolio(String reqnum) {
		return mybatisSession.delete("portfolioMapper.deleteportfolio", reqnum);
	}
	
	
	
	
}



















