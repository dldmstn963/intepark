package com.c4.intepark.album.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.c4.intepark.album.model.vo.Album;
import com.c4.intepark.common.CommonPage;

public interface AlbumService {
	
	int selectAllListCount(HashMap<String, Object> map);
	ArrayList<Album> selectList(CommonPage commonPage);
}
