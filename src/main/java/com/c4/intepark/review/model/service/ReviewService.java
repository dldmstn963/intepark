package com.c4.intepark.review.model.service;

import java.util.ArrayList;

import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.review.model.vo.Review;

public interface ReviewService {

	ArrayList<Review> selectrvList();
	Review selectrvOne(int rvnum);
	int insertReview(Portfolio portfolio);
	int updateReview(Portfolio portfolio);
	int deleteReview(int rvnum);
	
}
