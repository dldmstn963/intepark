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

	public int selectIdCheck(String userid) {
		return sqlSession.selectOne("inteuserMapper.selectIdCheck", userid);
	}

	public int selectEmailCheck(String useremail) {
		return sqlSession.selectOne("inteuserMapper.selectEmailCheck", useremail);
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
		return sqlSession.insert("inteuserMapper.insertLoginId", loginInfo);
	}

	public int updateUser(InteUser inteuser) {
		return sqlSession.update("inteuserMapper.updateUser", inteuser);
	}

	public int selectUserPwdCheck(LoginInfo loginfo) {
		return sqlSession.selectOne("inteuserMapper.selectUserPwdCheck", loginfo);
	}

	public int updateUserPwd(LoginInfo loginfo) {
		return sqlSession.update("inteuserMapper.updateUserPwd", loginfo);
	}

	public int updateDeleteUser(LoginMemberState logms) {
		return sqlSession.update("inteuserMapper.updateDeleteUser", logms);
	}

	public ArrayList<LoginMemberState> selectUserStopState(String userid) {
		List<LoginMemberState> list = sqlSession.selectList("inteuserMapper.selectUserStopState", userid);
		return (ArrayList<LoginMemberState>)list;
	}
	

}
