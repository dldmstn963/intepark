package com.c4.intepark.inteuser.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.inteuser.model.dao.InteuserDao;
import com.c4.intepark.inteuser.model.vo.InteUser;

@Service("userService")
public class InteuserServiceImpl implements InteuserService{
	
	public InteuserServiceImpl() {}
	
	@Autowired
	private InteuserDao userDao;

	@Override
	public InteUser selectLoginCheck(InteUser inteuser) {
		return userDao.selectLoginCheck(inteuser);
	}

	@Override
	public int insertUser(InteUser inteuser) {
		return userDao.insertUser(inteuser);
	}

	@Override
	public int selectIdCheck(String userid) {
		return userDao.selectIdCheck(userid);
	}

	@Override
	public int selectEmailCheck(String useremail) {
		return userDao.selectEmailCheck(useremail);
	}

}
