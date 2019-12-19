package com.c4.intepark.auction.model.service;

import java.util.ArrayList;

import com.c4.intepark.auction.model.vo.Auction;

public interface AuctionService {
	
ArrayList<Auction> auctionList();
int auctionEnroll(Auction auction);
}
