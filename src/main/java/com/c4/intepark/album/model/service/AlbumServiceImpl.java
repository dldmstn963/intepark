package com.c4.intepark.album.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.album.model.dao.AlbumDao;
import com.c4.intepark.album.model.vo.Album;
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
	public Album selectOneAlbum(int num) {
		return albumDao.selectOneAlbum(num);
	}

}
