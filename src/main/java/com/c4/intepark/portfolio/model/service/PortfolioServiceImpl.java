package com.c4.intepark.portfolio.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.portfolio.model.dao.PortfolioDao;
import com.c4.intepark.portfolio.model.vo.PfList;

@Service("portfolioService")
public class PortfolioServiceImpl implements PortfolioService{
	
	@Autowired
	private PortfolioDao portfolioDao;
	
	@Override
	public ArrayList<PfList> selectList() {
		return portfolioDao.selectList();
	}

}
