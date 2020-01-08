package com.c4.intepark.portfolio.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.portfolio.model.dao.PortfolioDao;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.portfolio.model.vo.PortfolioFile;
import com.c4.intepark.review.model.vo.Review;
import com.c4.intepark.review.model.vo.RvAvg;

@Service("portfolioService")
public class PortfolioServiceImpl implements PortfolioService{
	
	@Autowired
	private PortfolioDao portfolioDao;
	
	@Override
	public ArrayList<Constructors> selectList() {
		return portfolioDao.selectList();
	}
	
	@Override
	public ArrayList<RvAvg> selectAllReview() {
		return portfolioDao.selectAllReview();
	}
	
	@Override
	public Constructors selectOneCons(String consid) {
		return portfolioDao.selectOneCons(consid);
	}

	@Override
	public RvAvg selectReview(String consid) {
		return portfolioDao.selectReview(consid);
	}
	
	@Override
	public ArrayList<Review> selectConsReviewList(String consid) {
		return portfolioDao.selectConsReviewList(consid);
	}
	
	@Override
	public int updateIntroduction(Constructors cons) {
		return portfolioDao.updateIntroduction(cons);
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





















