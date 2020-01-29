package com.c4.intepark.auction.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.auction.model.dao.AuctionDao;
import com.c4.intepark.auction.model.vo.Auction;
import com.c4.intepark.auction.model.vo.AuctionAttend;
import com.c4.intepark.auction.model.vo.NonAuction;
import com.c4.intepark.common.CommonPage;
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
		
		return auctionDao.auctionUpdate(auction);
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
	public ArrayList<AuctionAttend> auctionAttendList(CommonPage cpage){
		
		return (ArrayList<AuctionAttend>)auctionDao.auctionAttendList(cpage);
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
	@Override
	public int AuctionAttendProgress(AuctionAttend att) {
		return auctionDao.AuctionAttendProgress(att);
	}
	@Override
	public int AuctionProgress(AuctionAttend att) {
		return auctionDao.AuctionProgress(att);
	}
	@Override
	public int auctionAttendListCount(CommonPage cpage) {
		return auctionDao.auctionAttendListCount(cpage);
	}
	@Override
	public Auction AuctionProgress2(int auctionno) {
		return auctionDao.AuctionProgress2(auctionno);
	}
	@Override
	public int NonAuctionUpdate(NonAuction nonauction) {
		
		return auctionDao.NonAuctionUpdate(nonauction);
	}
	@Override
	public int MyAuctionAttendListCount(CommonPage cpage) {
		return auctionDao.MyAuctionAttendListCount(cpage);
	}
	@Override
	public ArrayList<AuctionAttend> MyAuctionAttendList(CommonPage cpage){
		return (ArrayList<AuctionAttend>)auctionDao.MyAuctionAttendList(cpage);
	}
	@Override
	public ArrayList<AuctionAttend> selectAttendTop4(){
		return (ArrayList<AuctionAttend>)auctionDao.selectAttendTop4();
	}
	@Override
	public Auction selectAuctionTop4(int auctionno1) {
		return auctionDao.selectAuctionTop4(auctionno1);
	}
}