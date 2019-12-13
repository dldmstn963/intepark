package com.c4.intepark.auction.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.c4.intepark.auction.model.service.AuctionService;
import com.c4.intepark.auction.model.vo.Auction;

@Controller
public class AuctionController {
	
	private static final Logger logger = LoggerFactory.getLogger(AuctionController.class);
	@Autowired
	private AuctionService auctionService;
	//@Autowired 애노테이션을 사용하면 get/set 접근 메서드를 더 이상 만들지 않아도  SpringFramework 이 설정 파일을 통해서 알아서 get/set 접근 메서드 대신 실행함.
public AuctionController() {}

@RequestMapping("auctionList2.do")
public String auctionList(HttpServletRequest request,HttpServletResponse response) {
	
	ArrayList<Auction> list = auctionService.auctionList();
	request.setAttribute("list", list);
	return "auction/auctionList";
}

@RequestMapping("auction2.do")
public String auctionEnrollPage() {
	
	return "auction/auctionEnroll";
}

@RequestMapping("auctionEnd2.do")
public String auctionEndList() {
	
	return "auction/auctionEndList";
}

	 @RequestMapping(value="auctionEnroll2.do", method=RequestMethod.POST) 
	 public String auctionEnroll(Auction auction, HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {
		 List<MultipartFile> fileList = mtfRequest.getFiles("upfile");
		 String savePath = request.getSession().getServletContext().getRealPath("resources/auctionUpFile");
	String ofile = "";	
	for (MultipartFile mf : fileList) {
		try {
			mf.transferTo(new File(savePath + "\\" + mf.getOriginalFilename()));
		} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
		}
	ofile += mf.getOriginalFilename() + "/";
	}
	String ofile1 =  ofile.substring(0, ofile.length()-1);
	auction.setOfile(ofile1);
	logger.info("auction : " + auction); 
	 return "auction/auctionEnroll";
}
	
	 
}