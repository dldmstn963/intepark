package com.c4.intepark.auction.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.auction.model.dao.AuctionDao;
import com.c4.intepark.auction.model.vo.Auction;

@Service("auctionService")
public class AuctionServiceImpl implements AuctionService{

	@Autowired
	private AuctionDao auctionDao;

	@Override
	public ArrayList<Auction> auctionList() {
		
		return (ArrayList<Auction>)auctionDao.selectList();
		// TODO Auto-generated method stub
		
	}
	
}
