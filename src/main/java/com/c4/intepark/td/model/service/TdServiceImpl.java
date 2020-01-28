package com.c4.intepark.td.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.td.model.dao.TdDao;

@Service("tdService")
public class TdServiceImpl implements TdService{

	@Autowired
	private TdDao tdDao;
	
}
