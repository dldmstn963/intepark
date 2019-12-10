package com.c4.intepark.auction.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.auction.model.dao.AuctionDao;

@Service("auctionService")
public class AuctionServiceImpl implements AuctionService{


	@Autowired
	private AuctionDao auctionDao;

	@Override
	public void auctionList() {
		// TODO Auto-generated method stub
		
	}
	
}
