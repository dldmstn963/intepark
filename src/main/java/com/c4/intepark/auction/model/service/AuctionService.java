package com.c4.intepark.auction.model.service;

import java.util.ArrayList;

import com.c4.intepark.auction.model.vo.Auction;
import com.c4.intepark.auction.model.vo.AuctionAttend;
import com.c4.intepark.auction.model.vo.NonAuction;
import com.c4.intepark.common.Pagination;
import com.c4.intepark.common.Search;

public interface AuctionService {
	
ArrayList<Auction> auctionList(Search search);
int auctionEnroll(Auction auction);
int nonAuctionEnroll(NonAuction nonauction);
ArrayList<NonAuction> NonAuctionList(Pagination pagination);
int auctionUpdate(Auction auction);
Auction auctionDetailView(String auc);
NonAuction nonAuctionDetailView(String nonauc);
int deleteAuction(String auction);
ArrayList<AuctionAttend> auctionAttendList(int auction);
int auctionAttendEnroll(AuctionAttend att);
AuctionAttend auctionAttendDetail(AuctionAttend att);
int auctionAttendDelete(AuctionAttend auction);
int deleteNonAuction(int auctionno);
Integer selectAuctionCount(Search search);
Integer selectNonAuctionCount(Search search);


}
