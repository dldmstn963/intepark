package com.c4.intepark.auction.model.service;

import java.util.ArrayList;

import com.c4.intepark.auction.model.vo.Auction;
import com.c4.intepark.auction.model.vo.NonAuction;

public interface AuctionService {
	
ArrayList<Auction> auctionList();
int auctionEnroll(Auction auction);
int nonAuctionEnroll(NonAuction nonauction);
ArrayList<NonAuction> NonAuctionList();
int auctionUpdate(Auction auction);
Auction auctionDetailView(String auc);
NonAuction nonAuctionDetailView(String nonauc);
int deleteAuction(String auction);

}
