package com.c4.intepark.query.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.query.model.vo.Query;
import com.c4.intepark.query.model.service.QueryService;
import com.c4.intepark.query.model.dao.QueryDao;

@Service("queryService")
public class QueryServiceImpl implements QueryService{
	public QueryServiceImpl() {}
	
	@Autowired
	private QueryDao queryDao;

	@Override
	public ArrayList<Query> selectAll() {
		// TODO Auto-generated method stub
		return queryDao.selectAll();
	}

	@Override
	public Query selectOne(int queryno) {
		// TODO Auto-generated method stub
		return queryDao.selectOne();
	}

	@Override
	public ArrayList<Query> querySearch(String search) {
		// TODO Auto-generated method stub
		return queryDao.querySearch(search);
	}

	@Override
	public int queryinsert(Query query) {
		
		return queryDao.queryinsert(query);
	}

	@Override
	public Query queryUpdate(int idx) {
		// TODO Auto-generated method stub
		return queryDao.queryUpdate(idx);
	}

	@Override
	public int queryDelete(int queryno) {
		// TODO Auto-generated method stub
		return queryDao.queryDelete(queryno);
	}

	@Override
	public int insertqueryreply(Query query) {
		// TODO Auto-generated method stub
		return 0;
	}

}
