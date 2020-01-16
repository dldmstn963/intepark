package com.c4.intepark.inteuser.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.inteuser.model.dao.InteuserDao;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;
import com.c4.intepark.loginInfo.model.vo.LoginMemberState;

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
	public InteUser selectUserDetail(String userid) {
		return userDao.selectUserDetail(userid);
	}

	@Override
	public int insertLoginId(LoginInfo loginInfo) {
		return userDao.insertLoginId(loginInfo);
	}

	@Override
	public int updateUser(InteUser inteuser) {
		return userDao.updateUser(inteuser);
	}

	@Override
	public int selectUserPwdCheck(LoginInfo loginfo) {
		return userDao.selectUserPwdCheck(loginfo);
	}

	@Override
	public int updateUserPwd(LoginInfo loginfo) {
		return userDao.updateUserPwd(loginfo);
	}

	@Override
	public int updateDeleteUser(LoginMemberState logms) {
		return userDao.updateDeleteUser(logms);
	}

	@Override
	public ArrayList<LoginMemberState> selectUserStopState(String userid) {
		return userDao.selectUserStopState(userid);
	}

	@Override
	public int insertUserLetStop(LoginMemberState userState) {
		return userDao.insertUserLetStop(userState);
	}

}
