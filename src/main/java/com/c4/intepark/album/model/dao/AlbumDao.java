package com.c4.intepark.album.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.album.model.vo.Album;
import com.c4.intepark.album.model.vo.AlbumReply;
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

	public Album selectOneAlbum(int anum) {
		return sqlSession.selectOne("albumMapper.selectOneAlbum", anum);
	}

	public ArrayList<AlbumReply> selectOneAlbumReply(int anum) {
		List<AlbumReply> list = sqlSession.selectList("albumReplyMapper.selectReplyList", anum);
		return (ArrayList<AlbumReply>) list;
	}

	public int selectReplyCount(int anum) {
		return sqlSession.selectOne("albumReplyMapper.selectReplyCount", anum);
	}

	public int insertAlbumReply(AlbumReply aReply) {
		return sqlSession.insert("albumReplyMapper.insertAlbumReply", aReply);
	}

	public int selectMaxGroupOrder(AlbumReply aReply) {
		return sqlSession.selectOne("albumReplyMapper.selectMaxGroupOrder", aReply);
	}

	public int updateReply(AlbumReply aReply) {
		return sqlSession.update("albumReplyMapper.updateReply", aReply);
	}

	public int insertRReply(AlbumReply aReply) {
		return sqlSession.insert("albumReplyMapper.insertRReply", aReply);
	}

	public int selectMinGroupOrder(AlbumReply aReply) {
		return sqlSession.selectOne("albumReplyMapper.selectMinGroupOrder", aReply);
	}

	public int updateReplyDelete(int replyNo) {
		return sqlSession.update("albumReplyMapper.updateReplyDelete", replyNo);
	}

	public int updateReplyContents(AlbumReply aReply) {
		return sqlSession.update("albumReplyMapper.updateReplyContents", aReply);
	}


}
