package com.c4.intepark.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.review.model.vo.Review;

@Repository("reviewDao")
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public ReviewDao() {}
	
	public Constructors selectReviewForm(String consid) {
		return mybatisSession.selectOne("reviewMapper.selectReviewForm", consid);
	}
	
	public int insertReview(Review rv) {
		return mybatisSession.insert("reviewMapper.insertReview", rv);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<Review> selectrvList() {
		List<Review> list = mybatisSession.selectList("reviewMapper.selectrvList");
		return (ArrayList<Review>)list;
	}

	public Review selectrvOne(int rvnum) {
		return mybatisSession.selectOne("reviewMapper.selectrvOne", rvnum);
	}


	public int updateReview(Portfolio portfolio) {
		// TODO Auto-generated method stub
		return mybatisSession.update("reviewMapper.updateReview", portfolio);
	}

	public int deleteReview(int rvnum) {
		return mybatisSession.delete("reviewMapper.deleteReview", rvnum);
	}

	

	
	
	
}













