package com.c4.intepark.portfolio.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.portfolio.model.dao.PortfolioDao;

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
	public Constructors selectRequest(String consid) {
		return portfolioDao.selectRequest(consid);
	}

	


}
