package com.c4.intepark.album.model.service;

import java.util.ArrayList;

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
	public int selectAllListCount() {
		return albumDao.selectAllListCount();
	}

	@Override
	public ArrayList<Album> selectList(CommonPage commonPage) {
		return albumDao.selectList(commonPage);
	}

}
