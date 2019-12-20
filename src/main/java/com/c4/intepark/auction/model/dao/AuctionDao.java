package com.c4.intepark.auction.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.auction.model.vo.Auction;
import com.c4.intepark.auction.model.vo.NonAuction;

@Repository("auctionDao")
public class AuctionDao {
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
public AuctionDao() {}

public ArrayList<Auction> selectList(){
	
	List<Auction> list = mybatisSession.selectList("auctionMapper.selectList");
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

public ArrayList<NonAuction> NonAuctionList() {
	List<NonAuction> list2 = mybatisSession.selectList("auctionMapper.NonAuctionList");
	return (ArrayList<NonAuction>)list2;
}

}
