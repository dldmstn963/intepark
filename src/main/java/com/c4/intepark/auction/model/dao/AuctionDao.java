package com.c4.intepark.auction.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.auction.model.vo.Auction;

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
}
