package com.c4.intepark.album.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.album.model.dao.AlbumDao;
import com.c4.intepark.album.model.vo.Album;
import com.c4.intepark.album.model.vo.AlbumReply;
import com.c4.intepark.common.CommonPage;
@Service("albumService")
public class AlbumServiceImpl implements AlbumService{
	
	@Autowired
	private AlbumDao albumDao;
	
	@Override
	public ArrayList<Album> selectList(CommonPage commonPage) {
		return albumDao.selectList(commonPage);
	}

	@Override
	public int selectAllListCount(HashMap<String, Object> map) {
		return albumDao.selectAllListCount(map);
	}

	@Override
	public Album selectOneAlbum(int anum) {
		return albumDao.selectOneAlbum(anum);
	}

	@Override
	public ArrayList<AlbumReply> selectOneAlbumReply(int anum) {
		return albumDao.selectOneAlbumReply(anum);
	}

	@Override
	public int selectReplyCount(int anum) {
		return albumDao.selectReplyCount(anum);
	}

	@Override
	public int insertAlbumReply(AlbumReply aReply) {
		return albumDao.insertAlbumReply(aReply);
	}

	@Override
	public int selectMaxGroupOrder(AlbumReply aReply) {
		return albumDao.selectMaxGroupOrder(aReply);
	}

	@Override
	public int updateReply(AlbumReply aReply) {
		return albumDao.updateReply(aReply);
	}

	@Override
	public int insertRReply(AlbumReply aReply) {
		return albumDao.insertRReply(aReply);
	}

	@Override
	public int selectMinGroupOrder(AlbumReply aReply) {
		return albumDao.selectMinGroupOrder(aReply);
	}

	@Override
	public int updateReplyDelete(int replyNo) {
		return albumDao.updateReplyDelete(replyNo);
	}

	@Override
	public int updateReplyContents(AlbumReply aReply) {
		return albumDao.updateReplyContents(aReply);
	}


}
