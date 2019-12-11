package com.c4.intepark.shop.requests.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.shop.requests.model.dao.RequestsDao;

@Service("requestsService")
public class RequestsServiceImpl implements RequestsService{
	
	@Autowired
	private RequestsDao requestsDao;
	
	
}
