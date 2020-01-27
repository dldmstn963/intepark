package com.c4.intepark.inteuser.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;
import com.c4.intepark.loginInfo.model.vo.LoginMemberState;

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

	public int selectAllListCount(CommonPage cpage) {
		return sqlSession.selectOne("inteuserMapper.selectAllListCount", cpage);
	}

	public ArrayList<InteUser> selectAllList(CommonPage cpage) {
		List<InteUser> list = sqlSession.selectList("inteuserMapper.selectAllList", cpage);
		return (ArrayList<InteUser>)list;
	}

	public InteUser selectUserDetail(String userid) {
		return sqlSession.selectOne("inteuserMapper.selectUserDetail", userid);
	}

	public int insertLoginId(LoginInfo loginInfo) {
		return sqlSession.insert("loginInfoMapper.insertLoginUserId", loginInfo);
	}

	public int updateUser(InteUser inteuser) {
		return sqlSession.update("inteuserMapper.updateUser", inteuser);
	}

	public ArrayList<LoginMemberState> selectUserStopState(String userid) {
		List<LoginMemberState> list = sqlSession.selectList("loginInfoMapper.selectStopState", userid);
		return (ArrayList<LoginMemberState>)list;
	}

	public int selectIdCheck(String logid) {
		return sqlSession.selectOne("loginInfoMapper.selectIdCheck", logid);
	}

	public InteUser selectUserSession(String logid) {
		return sqlSession.selectOne("inteuserMapper.selectUserSession", logid);
	}
}
