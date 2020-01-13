package com.c4.intepark.shop.goods.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.dao.GoodsDao;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsPic;
import com.c4.intepark.shop.goods.model.vo.GoodsReview;
import com.c4.intepark.shop.goods.model.vo.GoodsSearch;
import com.c4.intepark.shop.goods.model.vo.Inquiry;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	private GoodsDao goodsDao;

	
	
	
	
	@Override
	public int insertGoods(Goods goods) {
		return goodsDao.insertGoods(goods);
	}


	@Override
	public int selectlistCount(String consid) {
		return goodsDao.selectlistCount(consid);
	}

	@Override
	public ArrayList<Goods> selectgoodsList(GoodsSearch goodssearch) {
		return goodsDao.selectgoodsList(goodssearch);
	}


	@Override
	public int deleteGoods(int goodsnum) {
		return goodsDao.deleteGoods(goodsnum);
	}


	@Override
	public Goods selectGoods(int goodsnum) {
		return goodsDao.selectGoods(goodsnum);
	}


	@Override
	public int updateGoods(Goods goods) {
		return goodsDao.updateGoods(goods);
	}


	@Override
	public int selectsearchlistCount(GoodsSearch goodsSearch) {
		return goodsDao.selectsearchlistCount(goodsSearch);
	}


	@Override
	public ArrayList<Goods> selectgoodsSearchList(GoodsSearch goodsSearch) {
		return goodsDao.selectgoodsSearchList(goodsSearch);
	}


	@Override
	public int selectcategoryAllListCount() {
		return goodsDao.selectcategoryAllListCount();
	}


	@Override
	public ArrayList<Goods> selectcategoryGoodsAllList(Paging p) {
		return goodsDao.selectcategoryGoodsAllList(p);
	}


	@Override
	public ArrayList<Goods> selectshopMainGoods(Paging p) {
		return goodsDao.selectshopMainGoods(p);
	}


	@Override
	public int selectGoodsNum(Goods goods) {
		return goodsDao.selectGoodsNum(goods);
	}


	@Override
	public int insertGoodsPic(GoodsPic gp) {
		return goodsDao.insertGoodsPic(gp);
	}


	@Override
	public ArrayList<GoodsPic> selectGoodsPic(int goodsnum) {
		return goodsDao.selectGoodsPic(goodsnum);
	}


	@Override
	public int selectgoodsReviewAllListCount(int goodsnum) {
		return goodsDao.selectgoodsReviewAllListCount(goodsnum);
	}


	@Override
	public ArrayList<GoodsReview> selectGoodsReview(GoodsSearch goodsSearch) {
		return goodsDao.selectGoodsReview(goodsSearch);
	}
	
	@Override
	public int selectgoodsInquiryAllListCount(int goodsnum) {
		return goodsDao.selectgoodsInquiryAllListCount(goodsnum);
	}


	@Override
	public ArrayList<Inquiry> selectGoodsInquiry(GoodsSearch goodsSearch) {
		return goodsDao.selectGoodsInquiry(goodsSearch);
	}


	@Override
	public int insertGoodsReview(GoodsReview goodsreview) {
		return goodsDao.insertGoodsReview(goodsreview);
	}


	@Override
	public int insertGoodsInquiry(Inquiry goodsinquiry) {
		return goodsDao.insertGoodsInquiry(goodsinquiry);
	}


	@Override
	public int selectcategoryListCount(int categorynum) {
		return goodsDao.selectcategoryListCount(categorynum);
	}


	@Override
	public ArrayList<Goods> selectcategoryGoodsList(GoodsSearch goodsSearch) {
		return goodsDao.selectcategoryGoodsList(goodsSearch);
	}


	@Override
	public int insertReviewPic(GoodsPic gp) {
		return goodsDao.insertReviewPic(gp);
	}


	@Override
	public int selectGoodsReviewNum() {
		return goodsDao.selectGoodsReviewNum();
	}
	
}
