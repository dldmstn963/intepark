package com.c4.intepark.inteuser.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.inteuser.dao.InteuserDao;
import com.c4.intepark.inteuser.vo.InteUser;

@Service("userService")
public class InteuserServiceImpl implements InteuserService{
	
	@Autowired
	private InteuserDao userDao;

	@Override
	public InteUser loginCheck(InteUser inteuser) {
		return userDao.loginCheck(inteuser);
	}

}
