package com.c4.intepark.album.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.c4.intepark.album.model.service.AlbumService;
import com.c4.intepark.album.model.vo.Album;
import com.c4.intepark.common.CommonPage;

@Controller
public class AlbumController {
	
	@Autowired
	private AlbumService albumService;
	
	@RequestMapping("albumWrite6.do")
	public String albumWritePage() {
		return "album/albumWrite";
	}
	
	@RequestMapping("albumlist6.do")
	public String albumListPage(HttpServletRequest request, Model model) {
		//현재페이지 설정
		int currentPage = 1;
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		//전체페이지 수찾기(검색포함)
		int listCount=0;
		HashMap<String,Object> map = new HashMap<String,Object>();
		String sOption = request.getParameter("selectoption");
		String sText = request.getParameter("searchtext");
		if(sOption != null && sOption !="") {
			if(sOption.equals("title"))
				map.put("stitle", sText);
			else
				map.put("userid", sText);
		}else {
			map.put("no", "no");
		}
		listCount = albumService.selectAllListCount(map);
		//페이징처리 객체 생성
		CommonPage commonPage= new CommonPage(6,10,listCount,currentPage);
		if(sOption != null && sOption !="") {
			if(sOption.equals("title"))
				commonPage.setStitle(sText);
			else
				commonPage.setUserid(sText);
		}
		ArrayList<Album> albumList = albumService.selectList(commonPage);
		model.addAttribute("selectoption", sOption);
		model.addAttribute("searchtext", sText);
		model.addAttribute("commonPage", commonPage);
		model.addAttribute("albumList", albumList);
		return "album/albumList";
	}
	
}
