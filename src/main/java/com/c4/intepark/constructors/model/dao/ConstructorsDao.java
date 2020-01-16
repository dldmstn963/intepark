package com.c4.intepark.constructors.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.constructors.model.vo.Constructors;

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

	public Constructors selectAdConsDetail(String consid) {
		return sqlSession.selectOne("constructorsMapper.selectAdConsDetail", consid);
	}

}
