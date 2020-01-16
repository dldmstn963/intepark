package com.c4.intepark.auction.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.auction.model.vo.Auction;
import com.c4.intepark.auction.model.vo.AuctionAttend;
import com.c4.intepark.auction.model.vo.NonAuction;
import com.c4.intepark.common.CommonPage;
import com.c4.intepark.common.Pagination;
import com.c4.intepark.common.Search;

@Repository("auctionDao")
public class AuctionDao {
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
public AuctionDao() {}

public ArrayList<Auction> selectList(Search search){
	
	List<Auction> list = mybatisSession.selectList("auctionMapper.selectList",search);
	return (ArrayList<Auction>)list;
}


public int auctionEnroll(Auction auction) {
	// TODO Auto-generated method stub
	return mybatisSession.insert("auctionMapper.auctionEnroll", auction);
}
public int nonAuctionEnroll(NonAuction nonauction) {
	// TODO Auto-generated method stub
	return mybatisSession.insert("auctionMapper.nonAuctionEnroll", nonauction);
}

public ArrayList<NonAuction> NonAuctionList(Pagination pagination) {
	List<NonAuction> list2 = mybatisSession.selectList("auctionMapper.NonAuctionList",pagination);
	return (ArrayList<NonAuction>)list2;
}
public int auctionUpdate(Auction auction) {
	
	return mybatisSession.update("auctionMapper.auctionUpdate", auction);
}

public NonAuction nonAuctionDetailView(String nonauc) {
	NonAuction nonauction = mybatisSession.selectOne("auctionMapper.nonAuctionDetailView",nonauc);
	return nonauction;
}

public Auction auctionDetailView(String auc) {
	Auction auction = mybatisSession.selectOne("auctionMapper.auctionDetailView",auc);
	return auction;
}

public int deleteAuction(String auction) {

	return mybatisSession.delete("auctionMapper.deleteAuction", auction);
}

public ArrayList<AuctionAttend> auctionAttendList(CommonPage cpage) {
	List<AuctionAttend> list = mybatisSession.selectList("auctionMapper.selectAttendList", cpage);
	
	return (ArrayList<AuctionAttend>)list;
}

public int auctionAttendEnroll(AuctionAttend att) {
	return mybatisSession.insert("auctionMapper.auctionAttendEnroll", att);
}

public AuctionAttend auctionAttendDetail(AuctionAttend att) {
	AuctionAttend auctionAttend = mybatisSession.selectOne("auctionMapper.auctionAttendDetail",att);
	return auctionAttend;
}

public int auctionAttendDelete(AuctionAttend auction) {
	
	return mybatisSession.delete("auctionMapper.auctionAttendDelete", auction);
}

public int deleteNonAuction(int auctionno) {
	return mybatisSession.delete("auctionMapper.deleteNonAuction", auctionno);
}

public Integer selectAuctionCount(Search search) {

	return mybatisSession.selectOne("auctionMapper.selectAuctionCount",search);
}

public Integer selectNonAuctionCount(Search search) {
	return mybatisSession.selectOne("auctionMapper.selectNonAuctionCount",search);
}

public int AuctionAttendProgress(AuctionAttend att) {
	// TODO Auto-generated method stub
	return mybatisSession.update("auctionMapper.AuctionAttendProgress", att);
}
public int AuctionProgress(AuctionAttend att) {
	// TODO Auto-generated method stub
	return mybatisSession.update("auctionMapper.AuctionProgress", att);
}

public int auctionAttendListCount(CommonPage cpage) {
	// TODO Auto-generated method stub
return mybatisSession.selectOne("auctionMapper.auctionAttendListCount",cpage);
}
}