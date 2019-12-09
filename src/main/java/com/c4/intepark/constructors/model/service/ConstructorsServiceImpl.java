package com.c4.intepark.constructors.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.constructors.model.dao.ConstructorsDao;
import com.c4.intepark.constructors.model.vo.Constructors;

@Service("consService")
public class ConstructorsServiceImpl implements ConstructorsService{

	public ConstructorsServiceImpl() {}
	
	@Autowired
	private ConstructorsDao consDao;
	
	@Override
	public Constructors loginCheck(Constructors cons) {
		return consDao.loginCheck(cons);
	}

}
