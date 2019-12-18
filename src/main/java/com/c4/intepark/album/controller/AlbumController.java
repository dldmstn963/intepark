package com.c4.intepark.album.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.c4.intepark.album.model.service.AlbumService;
import com.c4.intepark.album.model.vo.Album;
import com.c4.intepark.common.CommonPage;

@Controller
public class AlbumController {
	
	@Autowired
	private AlbumService albumService;
	
	@RequestMapping("albumlist6.do")
	public String albumListPage() {
		int listCount = albumService.selectAllListCount();
		CommonPage commonPage= new CommonPage(6,10,listCount,3);
		ArrayList<Album> albumList = albumService.selectList(commonPage);
		
		return "album/albumList";
	}
	
}
