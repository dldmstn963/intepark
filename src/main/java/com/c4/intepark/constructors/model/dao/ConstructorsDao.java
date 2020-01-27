package com.c4.intepark.constructors.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;
import com.c4.intepark.loginInfo.model.vo.LoginMemberState;

@Repository("consDao")
public class ConstructorsDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ConstructorsDao() {}
	
	public Constructors loginCheck(Constructors cons) {
		return sqlSession.selectOne("constructorsMapper.loginCheck", cons);
	}

	public int selectAllListCount(CommonPage cpage) {
		return sqlSession.selectOne("constructorsMapper.selectAllListCount", cpage);
	}

	public ArrayList<Constructors> selectAllList(CommonPage cpage) {
		List<Constructors> list = sqlSession.selectList("constructorsMapper.selectAllList", cpage);
		return (ArrayList<Constructors>) list;
	}

	public Constructors selectConsDetail(String consid) {
		return sqlSession.selectOne("constructorsMapper.selectConsDetail", consid);
	}

	public int insertLoginId(LoginInfo loginInfo) {
		return sqlSession.insert("loginInfoMapper.insertLoginConsId", loginInfo);
	}

	public int insertCons(Constructors cons) {
		return sqlSession.insert("constructorsMapper.insertCons", cons);
	}

	public ArrayList<LoginMemberState> selectConsStopState(String consid) {
		List<LoginMemberState> list = sqlSession.selectList("loginInfoMapper.selectStopState", consid);
		return (ArrayList<LoginMemberState>)list;
	}

	public int updateConsApproval(String consid) {
		return sqlSession.update("loginInfoMapper.updateConsApproval", consid);
	}

	public int deleteConsRefuse(String consid) {
		return sqlSession.delete("loginInfoMapper.deleteConsRefuse", consid);
	}

	public int updateCons(Constructors cons) {
		return sqlSession.update("constructorsMapper.updateCons", cons);
	}

}
