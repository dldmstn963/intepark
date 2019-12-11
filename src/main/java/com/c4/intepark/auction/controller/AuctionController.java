package com.c4.intepark.auction.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.c4.intepark.auction.model.service.AuctionService;
import com.c4.intepark.auction.model.vo.Auction;

@Controller
public class AuctionController {
	
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
public String auctionEnroll() {
	
	return "auction/auctionEnroll";
}
}