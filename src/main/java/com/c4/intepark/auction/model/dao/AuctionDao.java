package com.c4.intepark.auction.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("auctionDao")
public class AuctionDao {
	@Autowired
	private SqlSessionTemplate mybatisSession;
public AuctionDao() {}
}
