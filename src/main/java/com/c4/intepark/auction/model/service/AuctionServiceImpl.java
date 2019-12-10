package com.c4.intepark.auction.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.c4.intepark.auction.model.dao.AuctionDao;

@Service("auctionService")
public class AuctionServiceImpl implements AuctionService{

	@Resource(name="auctionDao")
	private AuctionDao auctionDao;

	@Override
	public void auctionList() {
		// TODO Auto-generated method stub
		
	}
	
}
