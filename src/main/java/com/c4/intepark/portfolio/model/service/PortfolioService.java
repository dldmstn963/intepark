package com.c4.intepark.portfolio.model.service;

import java.util.ArrayList;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.portfolio.model.vo.PortfolioFile;
import com.c4.intepark.review.model.vo.Review;
import com.c4.intepark.review.model.vo.RvAvg;

public interface PortfolioService {
	ArrayList<Constructors> selectList();
	ArrayList<RvAvg> selectAllReview();
	Constructors selectOneCons(String consid);
	RvAvg selectReview(String consid);
	ArrayList<Review> selectConsReviewList(String consid);
	int updateIntroduction(Constructors cons);
	
	
	
	
	
	
	int insertportfolio(Portfolio portfolio);
	int selectpfnum();
	int insertportfolioFile(PortfolioFile portfolioFile);
	int updateportfolio(Portfolio portfolio);
	int deleteportfolio(String reqnum);
	
	
	
}
