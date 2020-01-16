package com.c4.intepark.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.review.model.dao.ReviewDao;
import com.c4.intepark.review.model.vo.Review;
import com.c4.intepark.review.model.vo.ReviewFile;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public Constructors selectReviewForm(String consid) {
		return reviewDao.selectReviewForm(consid);
	}

	@Override
	public int insertReview(Review rv) {
		return reviewDao.insertReview(rv);
	}
	
	@Override
	public int selectrvnum(String userid) {
		return reviewDao.selectrvnum(userid);
	}

	@Override
	public void insertRvfile(ReviewFile rvfile) {
		reviewDao.insertRvfile(rvfile);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public ArrayList<Review> selectrvList() {
		return reviewDao.selectrvList();
	}

	@Override
	public Review selectrvOne(int rvnum) {
		return reviewDao.selectrvOne(rvnum);
	}


	@Override
	public int updateReview(Portfolio portfolio) {
		return reviewDao.updateReview(portfolio);
	}

	@Override
	public int deleteReview(int rvnum) {
		return reviewDao.deleteReview(rvnum);
	}

	

	






	

	

	
	

	
}
