package com.c4.intepark.inteuser.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.inteuser.model.dao.InteuserDao;
import com.c4.intepark.inteuser.model.vo.InteUser;

@Service("userService")
public class InteuserServiceImpl implements InteuserService{
	
	@Autowired
	private InteuserDao userDao;

	@Override
	public InteUser loginCheck(InteUser inteuser) {
		return userDao.loginCheck(inteuser);
	}

}
