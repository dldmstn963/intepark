package com.c4.intepark.album.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.album.model.dao.AlbumDao;
import com.c4.intepark.album.model.vo.Album;
import com.c4.intepark.album.model.vo.AlbumImgs;
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
	public int selectAllListCount(CommonPage commonPage) {
		return albumDao.selectAllListCount(commonPage);
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

	@Override
	public int insertAlbum(Album album) {
		return albumDao.insertAlbum(album);
	}

	@Override
	public int selectMaxAlbumNum(String userid) {
		return albumDao.selectMaxAlbumNum(userid);
	}

	@Override
	public void insertAlbumImg(AlbumImgs aImg) {
		int result = albumDao.insertAlbumImg(aImg);
	}

	@Override
	public ArrayList<AlbumImgs> selectImgList(int anum) {
		return albumDao.selectImgList(anum);
	}

	@Override
	public void deleteAlbum(int anum) {
		int result = albumDao.deleteAlbum(anum);
	}

	@Override
	public void deleteAlbumImg(AlbumImgs aimg) {
		int result = albumDao.deleteAlbumImg(aimg);
	}

	@Override
	public int updateAlbum(Album album) {
		return albumDao.updateAlbum(album);
	}

	@Override
	public void updateReadCount(int anum) {
		int result = albumDao.updateReadCount(anum);
	}

	@Override
	public ArrayList<Album> selectAlbumTop4() {
		return albumDao.selectAlbumTop4();
	}


}
