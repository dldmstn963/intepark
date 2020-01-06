package com.c4.intepark.album.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.c4.intepark.album.model.service.AlbumService;
import com.c4.intepark.album.model.vo.Album;
import com.c4.intepark.album.model.vo.AlbumReply;
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
	public String albumListPage(@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			CommonPage cpage, Model model) {
		//전체페이지 수찾기(검색포함)
		int listCount=0;
		System.out.println(cpage.toString());
		HashMap<String,Object> map = new HashMap<String,Object>();
		String sOption = cpage.getSelectoption();
		String sText = cpage.getSearchtext();
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
	
	@RequestMapping("albumView.do")
	public String albumViewPage(@RequestParam("anum") int anum,
		@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
		Album album = albumService.selectOneAlbum(anum);
		int aReplyCount = albumService.selectReplyCount(anum);
		ArrayList<AlbumReply> aReply = albumService.selectOneAlbumReply(anum);
		
		model.addAttribute("album", album);
		model.addAttribute("aReplyCount", aReplyCount);
		model.addAttribute("aReply", aReply);
		model.addAttribute("page", page);
		return "album/albumView";
	}
	
	@RequestMapping(value="albumReplyWrite.do", method=RequestMethod.POST)
	public String albumReplyWrite(AlbumReply aReply, @RequestParam("page") int page) {
		int result = albumService.insertAlbumReply(aReply);
		return "redirect:/albumView.do?anum="+aReply.getAlbumnum()+"&page="+page;
	}
	
	@RequestMapping(value="albumRReplyWrite.do", method=RequestMethod.POST)
	public String albumRReplyWrite(AlbumReply aReply, @RequestParam("page") int page) {

		int minGroupOrder = albumService.selectMinGroupOrder(aReply);
		if(minGroupOrder == -1) { //맨밑으로 가는형태라면
			int maxGroupOrder = albumService.selectMaxGroupOrder(aReply);
			aReply.setAlbumreplygrouporder(maxGroupOrder);
		}else { //중간에 껴들어가는 형태라면
			aReply.setAlbumreplygrouporder(minGroupOrder);
			int uResult = albumService.updateReply(aReply);
		}
		int iResult = albumService.insertRReply(aReply);	
		return "redirect:/albumView.do?anum="+aReply.getAlbumnum()+"&page="+page;
	}
	
	@RequestMapping("albumReplyDelete.do")
	public String replyDelete(@RequestParam("page") int page, @RequestParam("anum") int anum,
								@RequestParam("replyno") int replyNo) {

		int dResult= albumService.updateReplyDelete(replyNo);
		return "redirect:/albumView.do?anum="+anum+"&page="+page;
	}
	
	@RequestMapping(value="albumReplyUpdate.do", method=RequestMethod.POST)
	public String replyUpdate(@RequestParam("page") int page, AlbumReply aReply) {

		int dResult= albumService.updateReplyContents(aReply);
		return "redirect:/albumView.do?anum="+aReply.getAlbumnum()+"&page="+page;
	}
	
	@RequestMapping("albumFileUpload.do")
	public String albumFileUpload() {
		
		return "main";
	}
	
	
}

























