package com.c4.intepark.inteuser.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.inteuser.model.vo.InteUser;

@Repository("userDao")
public class InteuserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public InteuserDao() {}
	
	public InteUser loginCheck(InteUser inteuser) {
		return sqlSession.selectOne("inteuserMapper.loginCheck", inteuser);
	}
	

}