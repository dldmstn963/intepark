package com.c4.intepark.point.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.point.model.dao.PointDao;

@Service("pointService")
public class PointServiceImpl {

	@Autowired 
	private PointDao pointDao;
}
