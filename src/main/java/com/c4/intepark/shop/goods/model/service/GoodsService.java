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
}
