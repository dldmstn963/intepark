package com.c4.intepark.request.model.service;

import java.util.ArrayList;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.request.model.vo.Request;
import com.c4.intepark.review.model.vo.RvAvg;

public interface RequestService {
	Constructors selectRequestForm(String consid);
	int insertRequest(Request req);
	Constructors selectOneCons(String consid);
	RvAvg selectReview(String consid);
	ArrayList<Request> selectRequestList(String consid);
	ArrayList<Request> selectMyReqList(String userid);
	
	
	
	
	
	
	
	
	
	
	ArrayList<Request> selectReqConsList(String consid);
	int updateRequest(Request req);
	int deleteRequest(String reqnum);
	
	
	
}
