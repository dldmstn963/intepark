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
	
	public InteUser selectLoginCheck(InteUser inteuser) {
		return sqlSession.selectOne("inteuserMapper.selectLoginCheck", inteuser);
	}

	public int insertUser(InteUser inteuser) {
		return sqlSession.insert("inteuserMapper.insertUser", inteuser);
	}

	public int selectIdCheck(String userid) {
		return sqlSession.selectOne("inteuserMapper.selectIdCheck", userid);
	}

	public int selectEmailCheck(String useremail) {
		return sqlSession.selectOne("inteuserMapper.selectEmailCheck", useremail);
	}
	

}
