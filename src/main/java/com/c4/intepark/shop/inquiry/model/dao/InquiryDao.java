package com.c4.intepark.shop.inquiry.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.inquiry.model.vo.Inquiry;

@Repository("inquiryDao")
public class InquiryDao {
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public InquiryDao() {}

	public Goods selectGoods(int goodsnum) {
		return mybatis.selectOne("goodsMapper.selectGoods",goodsnum);
	}

	public int insertGoodsInquiry(Inquiry goodsinquiry) {
		return mybatis.insert("goodsInquirymapper.insertGoodsInquiry",goodsinquiry);
	}

	public int updateGoodsInquiry(Inquiry goodsinquiry) {
		return mybatis.update("goodsInquirymapper.updateGoodsInquiry",goodsinquiry);
	}

	public int deleteGoodsInquiry(Inquiry goodsinquiry) {
		return mybatis.delete("goodsInquirymapper.deleteGoodsInquiry",goodsinquiry);
	}
	
}
