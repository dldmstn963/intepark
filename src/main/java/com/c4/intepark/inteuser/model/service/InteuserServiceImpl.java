package com.c4.intepark.inteuser.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.inteuser.model.dao.InteuserDao;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;

@Service("inteUserService")
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

	@Override
	public int selectAllListCount(CommonPage cpage) {
		return userDao.selectAllListCount(cpage);
	}

	@Override
	public ArrayList<InteUser> selectAllList(CommonPage cpage) {
		return userDao.selectAllList(cpage);
	}

	@Override
	public InteUser selectAdUserDetail(String userid) {
		return userDao.selectAdUserDetail(userid);
	}

	@Override
	public int insertLoginId(LoginInfo loginInfo) {
		return userDao.insertLoginId(loginInfo);
	}

}
