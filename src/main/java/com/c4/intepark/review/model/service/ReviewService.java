package com.c4.intepark.review.model.service;

import java.util.ArrayList;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.review.model.vo.Review;
import com.c4.intepark.review.model.vo.ReviewFile;

public interface ReviewService {
	
	Constructors selectReviewForm(String consid);
	int insertReview(Review rv);
	int selectrvnum(String userid);
	void insertRvfile(ReviewFile rvfile);
	int deleteReview(int rvnum);
	ArrayList<ReviewFile> selectRvRename(int rvnum);
	
	
	
	
	
	
	
	
}



