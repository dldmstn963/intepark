package com.c4.intepark.shop.inquiry.model.service;

import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.inquiry.model.vo.Inquiry;

public interface InquiryService {

	Goods selectGoods(int goodsnum);

	int insertGoodsInquiry(Inquiry goodsinquiry);

	int updateGoodsInquiry(Inquiry goodsinquiry);

	int deleteGoodsInquiry(Inquiry goodsinquiry);

}
