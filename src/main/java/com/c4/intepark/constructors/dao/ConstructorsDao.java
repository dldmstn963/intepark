package com.c4.intepark.constructors.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.constructors.vo.Constructors;

@Repository("consDao")
public class ConstructorsDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ConstructorsDao() {}
	
	public Constructors loginCheck(Constructors cons) {
		return sqlSession.selectOne("constructorsMapper.loginCheck", cons);
	}

}
