package com.c4.intepark.query.model.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.query.model.vo.Query;
import com.c4.intepark.query.model.service.QueryService;

@Repository("queryDao")
public class QueryDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public QueryDao() {}

	public ArrayList<Query> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public Query selectOne() {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<Query> querySearch(String search) {
		// TODO Auto-generated method stub
		return null;
	}

	public int queryinsert(Query query) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Query queryUpdate(int idx) {
		// TODO Auto-generated method stub
		return null;
	}

	public int queryDelete(int queryno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
