package com.c4.intepark.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.request.model.vo.Request;
import com.c4.intepark.review.model.vo.Review;
import com.c4.intepark.review.model.vo.ReviewFile;

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
	
	public int selectrvnum(String userid) {
		return mybatisSession.selectOne("reviewMapper.selectrvnum", userid);
	}
	
	public int insertRvfile(ReviewFile rvfile) {
		return mybatisSession.insert("reviewMapper.insertRvfile", rvfile);
	}
	
	public int deleteReview(int rvnum) {
		return mybatisSession.delete("reviewMapper.deleteReview", rvnum);
	}
	
	public ArrayList<ReviewFile> selectRvRename(int rvnum) {
		List<ReviewFile> rvRename = mybatisSession.selectList("reviewMapper.selectRvRename", rvnum);
		return (ArrayList<ReviewFile>) rvRename;
	}
	
	
	
	
	
	
	
	
	
}



