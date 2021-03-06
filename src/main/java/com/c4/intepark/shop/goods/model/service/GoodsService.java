package com.c4.intepark.shop.goods.model.service;

import java.util.ArrayList;

import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsPic;
import com.c4.intepark.shop.goods.model.vo.GoodsReview;
import com.c4.intepark.shop.goods.model.vo.GoodsSearch;
import com.c4.intepark.shop.goods.model.vo.Inquiry;

public interface GoodsService {
	
	
	
	public int insertGoods(Goods goods);

	public int selectlistCount(String consid);
	
	public ArrayList<Goods> selectgoodsList(GoodsSearch goodssearch);

	public int deleteGoods(int goodsnum);

	public Goods selectGoods(int goodsnum);

	public int updateGoods(Goods goods);
	
	public int selectsearchlistCount(GoodsSearch goodsSearch);

	public ArrayList<Goods> selectgoodsSearchList(GoodsSearch goodsSearch);

	public int selectcategoryAllListCount();

	public ArrayList<Goods> selectcategoryGoodsAllList(Paging p);

	public ArrayList<Goods> selectshopMainGoods(Paging p);

	public int selectGoodsNum(Goods goods);

	public int insertGoodsPic(GoodsPic gp);

	public ArrayList<GoodsPic> selectGoodsPic(int goodsnum);

	public int selectgoodsReviewAllListCount(int goodsnum);

	public ArrayList<GoodsReview> selectGoodsReview(GoodsSearch goodsSearch);

	public int selectgoodsInquiryAllListCount(int goodsnum);

	public ArrayList<Inquiry> selectGoodsInquiry(GoodsSearch goodsSearch);

	public int insertGoodsReview(GoodsReview goodsreview);

	public int insertGoodsInquiry(Inquiry goodsinquiry);

	public int selectcategoryListCount(int categorynum);

	public ArrayList<Goods> selectcategoryGoodsList(GoodsSearch goodsSearch);

	public int insertReviewPic(GoodsPic gp);

	public int selectGoodsReviewNum();

	public GoodsReview selectGoodsReviewDetail(int reviewnum);

	public ArrayList<GoodsReview>  selectGoodsReviewDetailPic(int reviewnum);

	public float selectreviewscore(int goodsnum);

	public int selectGoodsInquiryNum();

	public int insertInquiryPic(GoodsPic gp);

	public Inquiry selectGoodsInquiryDetail(int inquirynum);

	public ArrayList<Inquiry> selectGoodsInquiryDetailPic(int inquirynum);

	public int deleteInquiry(int inquirynum);

	public int deleteInquiryPic(int inquirynum);

	public int deleteReview(int reviewnum);

	public int deleteReviewPic(int reviewnum);

	public ArrayList<Goods> selectgoodsList(String consid);

	public int insertGoodsAnswer(Inquiry inquiry);

	public int updateGoodsAnswer(int inquirynum);

	public Inquiry selectGoodsInquiryAnswer(int inquirynum);

	public int updateGoodsInquiryAnswer4(Inquiry in);

	public int selectcountInquiry(String consid);

	public int selectcountOrders(String consid);

	public int selectcountallOrders(String consid);

	public int selectcountallOrdersPrice(String consid);

	public ArrayList<Inquiry> selectNoanswerInquiryList(String consid);

}
