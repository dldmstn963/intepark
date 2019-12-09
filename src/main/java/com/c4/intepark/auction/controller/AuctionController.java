package com.c4.intepark.auction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.c4.intepark.auction.model.service.AuctionService;

@Controller
public class AuctionController {
	
	@Autowired 
	//@Autowired 애노테이션을 사용하면 get/set 접근 메서드를 더 이상 만들지 않아도  SpringFramework 이 설정 파일을 통해서 알아서 get/set 접근 메서드 대신 실행함.
	private AuctionService auctionService;
public AuctionController() {}
}
