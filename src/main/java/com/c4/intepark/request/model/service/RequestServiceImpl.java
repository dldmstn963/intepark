package com.c4.intepark.request.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.request.model.dao.RequestDao;
import com.c4.intepark.request.model.vo.Request;

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
	public ArrayList<Request> selectReqConsList(String consid) {
		return requestDao.selectReqConsList(consid);
	}

	@Override
	public int updateRequest(Request req) {
		return requestDao.updateRequest(req);
	}

	@Override
	public int deleteRequest(String reqnum) {
		return requestDao.deleteRequest(reqnum);
	}
}
















