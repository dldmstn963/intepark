package com.c4.intepark.request.model.service;

import java.util.ArrayList;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.request.model.vo.Request;

public interface RequestService {
	Constructors selectRequestForm(String consid);
	int insertRequest(Request req);
	ArrayList<Request> selectReqConsList(String consid);
	int updateRequest(Request req);
	int deleteRequest(String reqnum);
}
