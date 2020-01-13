package com.c4.intepark.auction.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.auction.model.dao.AuctionDao;
import com.c4.intepark.auction.model.vo.Auction;
import com.c4.intepark.auction.model.vo.AuctionAttend;
import com.c4.intepark.auction.model.vo.NonAuction;
import com.c4.intepark.common.Pagination;
import com.c4.intepark.common.Search;

@Service("auctionService")
public class AuctionServiceImpl implements AuctionService{

	@Autowired
	private AuctionDao auctionDao;

	@Override
	public ArrayList<Auction> auctionList(Search search) {
		
		return (ArrayList<Auction>)auctionDao.selectList(search);
		// TODO Auto-generated method stub
		
	}
	@Override
	public int auctionEnroll(Auction auction) {
		
		return auctionDao.auctionEnroll(auction);
	}
	@Override
	public int nonAuctionEnroll(NonAuction nonauction) {
		
		return auctionDao.nonAuctionEnroll(nonauction);
	}
	@Override
	public ArrayList<NonAuction> NonAuctionList(Pagination pagination){
		
		return (ArrayList<NonAuction>)auctionDao.NonAuctionList(pagination);
	}
	@Override
	public int auctionUpdate(Auction auction) {
		return 0;
		 
	}
	@Override
	public int deleteAuction(String auction){
		
		
		return auctionDao.deleteAuction(auction);
	}
	@Override
	public Auction auctionDetailView(String auc) {
	
		
		return  auctionDao.auctionDetailView(auc);
	}
	@Override
	public NonAuction nonAuctionDetailView(String nonauc) {
		
		return  auctionDao.nonAuctionDetailView(nonauc);
	}
	@Override
	public ArrayList<AuctionAttend> auctionAttendList(int auction){
		
		return (ArrayList<AuctionAttend>)auctionDao.auctionAttendList(auction);
	}
	@Override
	public int auctionAttendEnroll(AuctionAttend att) {
		
		return auctionDao.auctionAttendEnroll(att);
	}
	
	@Override
	public AuctionAttend auctionAttendDetail(AuctionAttend att) {
		
		return auctionDao.auctionAttendDetail(att);
	}
	@Override
	public int auctionAttendDelete(AuctionAttend auction) {
		
		return auctionDao.auctionAttendDelete(auction);
	}
	@Override
	public int deleteNonAuction(int auctionno) {
		
		return auctionDao.deleteNonAuction(auctionno);
	}
	@Override
	public Integer selectAuctionCount(Search search) {
		return auctionDao.selectAuctionCount(search);
	}
	@Override
	public Integer selectNonAuctionCount(Search search) {
		return auctionDao.selectNonAuctionCount(search);
	}
}