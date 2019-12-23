package com.c4.intepark.shop.inquiry.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.inquiry.model.dao.InquiryDao;
import com.c4.intepark.shop.inquiry.model.vo.Inquiry;

@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService{
	
	@Autowired
	private InquiryDao inquiryDao;

	@Override
	public Goods selectGoods(int goodsnum) {
		return inquiryDao.selectGoods(goodsnum);
	}

	@Override
	public int insertGoodsInquiry(Inquiry goodsinquiry) {
		return inquiryDao.insertGoodsInquiry(goodsinquiry);
	}

	@Override
	public int updateGoodsInquiry(Inquiry goodsinquiry) {
		return inquiryDao.updateGoodsInquiry(goodsinquiry);
	}

	@Override
	public int deleteGoodsInquiry(Inquiry goodsinquiry) {
		return inquiryDao.deleteGoodsInquiry(goodsinquiry);
	}
	
	
}
