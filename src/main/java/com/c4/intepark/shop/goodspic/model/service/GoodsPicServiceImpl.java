package com.c4.intepark.shop.goodspic.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.shop.goodspic.model.dao.GoodsPicDao;

@Service("goodspicService")
public class GoodsPicServiceImpl implements GoodsPicService{
	
	@Autowired
	private GoodsPicDao goodspicDao;
	
	
}
