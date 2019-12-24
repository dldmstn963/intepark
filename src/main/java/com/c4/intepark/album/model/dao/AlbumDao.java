package com.c4.intepark.album.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.album.model.vo.Album;
import com.c4.intepark.common.CommonPage;

@Repository("albumDao")
public class AlbumDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectAllListCount(HashMap<String, Object> map) {
		return sqlSession.selectOne("albumMapper.selectAllListCount", map);
	}

	public ArrayList<Album> selectList(CommonPage commonPage) {
		List<Album> list = sqlSession.selectList("albumMapper.selectList", commonPage); 
		return (ArrayList<Album>) list;
	}

	public Album selectOneAlbum(int num) {
		return sqlSession.selectOne("albumMapper.selectOneAlbum", num);
	}


}
