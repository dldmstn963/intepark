package com.c4.intepark.constructors.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.constructors.model.dao.ConstructorsDao;
import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;
import com.c4.intepark.loginInfo.model.vo.LoginMemberState;

@Service("consService")
public class ConstructorsServiceImpl implements ConstructorsService{

	public ConstructorsServiceImpl() {}
	
	@Autowired
	private ConstructorsDao consDao;
	
	@Override
	public Constructors loginCheck(Constructors cons) {
		return consDao.loginCheck(cons);
	}

	@Override
	public int selectAllListCount(CommonPage cpage) {
		return consDao.selectAllListCount(cpage);
	}

	@Override
	public ArrayList<Constructors> selectAllList(CommonPage cpage) {
		return consDao.selectAllList(cpage);
	}

	@Override
	public Constructors selectConsDetail(String consid) {
		return consDao.selectConsDetail(consid);
	}

	@Override
	public int insertLoginId(LoginInfo loginInfo) {
		return consDao.insertLoginId(loginInfo);
	}

	@Override
	public int insertCons(Constructors cons) {
		return consDao.insertCons(cons);
	}

	@Override
	public ArrayList<LoginMemberState> selectConsStopState(String consid) {
		return consDao.selectConsStopState(consid);
	}

	@Override
	public int updateConsApproval(String consid) {
		return consDao.updateConsApproval(consid);
	}

	@Override
	public int deleteConsRefuse(String consid) {
		return consDao.deleteConsRefuse(consid);
	}

	@Override
	public int updateCons(Constructors cons) {
		return consDao.updateCons(cons);
	}
}
