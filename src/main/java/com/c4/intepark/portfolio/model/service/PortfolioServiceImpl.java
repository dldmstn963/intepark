package com.c4.intepark.portfolio.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.portfolio.model.dao.PortfolioDao;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.portfolio.model.vo.PortfolioFile;

@Service("portfolioService")
public class PortfolioServiceImpl implements PortfolioService{
	
	@Autowired
	private PortfolioDao portfolioDao;
	
	@Override
	public ArrayList<Constructors> selectList() {
		return portfolioDao.selectList();
	}
	
	@Override
	public Constructors selectOneCons(String consid) {
		return portfolioDao.selectOneCons(consid);
	}

	@Override
	public int insertportfolio(Portfolio portfolio) {
		return portfolioDao.insertportfolio(portfolio);
	}

	@Override
	public int selectpfnum() {
		return portfolioDao.selectpfnum();
	}

	@Override
	public int insertportfolioFile(PortfolioFile portfolioFile) {
		return portfolioDao.insertportfolioFile(portfolioFile);
	}

	@Override
	public int updateportfolio(Portfolio portfolio) {
		return portfolioDao.updateportfolio(portfolio);
	}

	@Override
	public int deleteportfolio(String reqnum) {
		return portfolioDao.deleteportfolio(reqnum);
	}
	
	
}





















