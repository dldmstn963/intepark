package com.c4.intepark.constructors.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.common.CommonPage;
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

	@Override
	public int selectAllListCount(CommonPage cpage) {
		return consDao.selectAllListCount(cpage);
	}

	@Override
	public ArrayList<Constructors> selectAllList(CommonPage cpage) {
		return consDao.selectAllList(cpage);
	}

	@Override
	public Constructors selectAdConsDetail(String consid) {
		return consDao.selectAdConsDetail(consid);
	}

}
