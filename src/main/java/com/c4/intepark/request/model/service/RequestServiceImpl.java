package com.c4.intepark.request.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.request.model.dao.RequestDao;
import com.c4.intepark.request.model.vo.Request;
import com.c4.intepark.review.model.vo.RvAvg;

@Service("requestService")
public class RequestServiceImpl implements RequestService {

	@Autowired
	private RequestDao requestDao;
	
	@Override
	public Constructors selectRequestForm(String consid) {
		return requestDao.selectRequestForm(consid);
	}

	@Override
	public int insertRequest(Request req) {
		return requestDao.insertRequest(req);
	}
	
	@Override
	public Constructors selectOneCons(String consid) {
		return requestDao.selectOneCons(consid);
	}

	@Override
	public RvAvg selectReview(String consid) {
		return requestDao.selectReview(consid);
	}
	
	@Override
	public ArrayList<Request> selectRequestList(String consid) {
		return requestDao.selectRequestList(consid);
	}
	
	@Override
	public ArrayList<Request> selectMyReqList(String userid) {
		return requestDao.selectMyReqList(userid);
	}
	
	
	
	
	
	
	
	
}



