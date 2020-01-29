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

	public int updateMemberStop() {
		return sqlSession.update("loginInfoMapper.updateMemberStop");		
	}

	public int deleteMember() {
		return sqlSession.delete("loginInfoMapper.deleteMember");
	}

	public int selectIdCheck(String logid) {
		return sqlSession.selectOne("loginInfoMapper.selectIdCheck", logid);
	}

	public int selectEmailCheck(String logemail) {
		return sqlSession.selectOne("loginInfoMapper.selectEmailCheck", logemail);
	}

	public String selectFindUserId(InteUser inteuser) {
		return sqlSession.selectOne("loginInfoMapper.selectFindUserId", inteuser);
	}

	public int selectFindUserPwd(LoginInfo loginfo) {
		return sqlSession.selectOne("loginInfoMapper.selectFindUserPwd", loginfo);
	}

	public int updateNewLogPwd(LoginInfo loginfo) {
		return sqlSession.update("loginInfoMapper.updateNewLogPwd",loginfo);		
	}

	public String selectFindConsId(Constructors cons) {
		return sqlSession.selectOne("loginInfoMapper.selectFindConsId", cons);
	}

	public int insertMemberLetStop(LoginMemberState memberState) {
		return sqlSession.insert("loginInfoMapper.insertLetStop", memberState);
	}

	public int selectMaxStopNo(LoginMemberState memberState) {
		return sqlSession.selectOne("loginInfoMapper.selectMaxStopNo", memberState);
	}

	public int updateMemberStopRemove(LoginMemberState memberState) {
		return sqlSession.update("loginInfoMapper.updateStopRemove", memberState);
	}
	
	public String selectMemberPwdCheck(LoginInfo loginfo) {
		return sqlSession.selectOne("loginInfoMapper.selectMemberPwdCheck", loginfo);
	}

	public int updateMemberPwd(LoginInfo loginfo) {
		return sqlSession.update("loginInfoMapper.updateMemberPwd", loginfo);
	}

	public int updateDeleteMember(LoginMemberState logms) {
			return sqlSession.update("loginInfoMapper.updateDeleteMember", logms);
	}

}
