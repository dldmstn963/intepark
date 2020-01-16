package com.c4.intepark.loginInfo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;
import com.c4.intepark.loginInfo.model.vo.LoginMemberState;

@Repository("logDao")
public class LoginInfoDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public LoginInfo getUserById(String username) {
		return sqlSession.selectOne("loginInfoMapper.selectUserById", username);
	}

	public Constructors selectConsSession(String name) {
		return sqlSession.selectOne("constructorsMapper.selectConsSession", name);
	}

	public InteUser selectUserSession(String name) {
		return sqlSession.selectOne("inteuserMapper.selectUserSession", name);
	}

	public LoginMemberState selectMemberState(String logid) {
		return sqlSession.selectOne("loginInfoMapper.selectMemberState", logid);
	}

}
