package com.c4.intepark.portfolio.model.service;

import java.util.ArrayList;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.portfolio.model.vo.PortfolioFile;
import com.c4.intepark.portfolio.model.vo.PortfolioView;
import com.c4.intepark.review.model.vo.Review;
import com.c4.intepark.review.model.vo.ReviewFile;
import com.c4.intepark.review.model.vo.RvAvg;

public interface PortfolioService {
	ArrayList<Constructors> selectList();
	ArrayList<RvAvg> selectAllReview();
	ArrayList<Portfolio> selectPfPhotoList();
	Constructors selectOneCons(String consid);
	RvAvg selectReview(String consid);
	ArrayList<Review> selectConsReviewList(String consid);
	ArrayList<ReviewFile> selectConsRvFileList(String consid);
	int updateIntroduction(Constructors cons);
	ArrayList<PortfolioFile> selectPfOne(int pfnum);
	ArrayList<PortfolioView> selectPfOneList(String consid);
	ArrayList<PortfolioFile> selectPfRename(int pfnum);
	int deletePortfolio(int pfnum);
	int insertPF(Portfolio pf);
	int selectpfnum(String consid);
	void insertPfFile(PortfolioFile p);
	
	
	

}



