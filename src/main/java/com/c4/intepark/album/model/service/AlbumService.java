package com.c4.intepark.album.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.c4.intepark.album.model.vo.Album;
import com.c4.intepark.album.model.vo.AlbumImgs;
import com.c4.intepark.album.model.vo.AlbumReply;
import com.c4.intepark.common.CommonPage;

public interface AlbumService {
	
	int selectAllListCount(CommonPage commonPage);
	ArrayList<Album> selectList(CommonPage commonPage);
	Album selectOneAlbum(int anum);
	ArrayList<AlbumReply> selectOneAlbumReply(int anum);
	int selectReplyCount(int anum);
	int insertAlbumReply(AlbumReply aReply);
	int selectMaxGroupOrder(AlbumReply aReply);
	int updateReply(AlbumReply aReply);
	int insertRReply(AlbumReply aReply);
	int selectMinGroupOrder(AlbumReply aReply);
	int updateReplyDelete(int replyNo);
	int updateReplyContents(AlbumReply aReply);
	int insertAlbum(Album album);
	int selectMaxAlbumNum(String userid);
	void insertAlbumImg(AlbumImgs aImg);
	ArrayList<AlbumImgs> selectImgList(int anum);
	void deleteAlbum(int anum);
	void deleteAlbumImg(AlbumImgs aimg);
	int updateAlbum(Album album);
	void updateReadCount(int anum);
	ArrayList<Album> selectAlbumTop4();
}
