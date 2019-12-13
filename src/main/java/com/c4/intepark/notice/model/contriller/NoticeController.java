package com.c4.intepark.notice.model.contriller;


import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.c4.intepark.notice.model.service.NoticeService;
import com.c4.intepark.notice.model.vo.Notice;
import com.c4.intepark.notice.model.dao.NoticeDao;

@Controller	//현재 클래스를 컨트롤러 빈 등록

public class NoticeController {
	
	//의존관계 주입
	@Autowired
	NoticeService noticeService;
	
	public NoticeController() {}
	
	//01. 게시글 전체목록 보기
	@RequestMapping(value="nlist.do",method=RequestMethod.GET)
	public String noticeList(Model model) {
		
		ArrayList<Notice> list = noticeService.selectAll();
		
		if (list.size() > 0) {
			model.addAttribute("list",list);
			return "notice/noticeListView";
		}else {
			model.addAttribute("message", "공지사항 목록 보기실패!");
			return "common/error";
		}
		
		
		
		
	}
}
