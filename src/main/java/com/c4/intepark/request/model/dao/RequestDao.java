package com.c4.intepark.request.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.request.model.vo.Request;
import com.c4.intepark.review.model.vo.RvAvg;

@Repository("requestDao")
public class RequestDao {

	@Autowired
	private SqlSessionTemplate mybatisSession;

	public RequestDao() {}
	
	public Constructors selectRequestForm(String consid) {
		return mybatisSession.selectOne("requestMapper.selectRequestForm", consid);
	}

	public int insertRequest(Request req) {
		return mybatisSession.insert("requestMapper.insertRequest", req);
	}
	
	public Constructors selectOneCons(String consid) {
		return mybatisSession.selectOne("portfolioMapper.selectOneCons", consid);
	}

	public RvAvg selectReview(String consid) {
		return mybatisSession.selectOne("portfolioMapper.selectReview", consid);
	}
	
	public ArrayList<Request> selectRequestList(String consid) {
		List<Request> reqlist = mybatisSession.selectList("requestMapper.selectRequestList", consid);
		return (ArrayList<Request>) reqlist;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<Request> selectReqConsList(String consid) {
		List<Request> list = mybatisSession.selectList("requestMapper.selectReqConsList", consid);
		return (ArrayList<Request>)list;
	}

	public int updateRequest(Request req) {
		return mybatisSession.update("requestMapper.insertRequest", req);
	}

	public int deleteRequest(String reqnum) {
		return mybatisSession.delete("requestMapper.insertRequest", reqnum);
	}

	

	
}
















