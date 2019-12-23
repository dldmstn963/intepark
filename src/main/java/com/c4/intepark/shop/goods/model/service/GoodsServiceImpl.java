package com.c4.intepark.shop.goods.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.dao.GoodsDao;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsList;
import com.c4.intepark.shop.goods.model.vo.GoodsPic;
import com.c4.intepark.shop.goods.model.vo.GoodsSearch;
import com.c4.intepark.shop.goodsreview.model.vo.GoodsReview;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	private GoodsDao goodsDao;

	@Override
	public int insertGoods(Goods goods) {
		return goodsDao.insertGoods(goods);
	}


	@Override
	public int listCount(String consid) {
		return goodsDao.listCount(consid);
	}

	@Override
	public ArrayList<Goods> goodsList(GoodsList goodslist) {
		return goodsDao.listGoods(goodslist);
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
	public int searchlistCount(GoodsSearch goodsSearch) {
		return goodsDao.searchlistCount(goodsSearch);
	}


	@Override
	public ArrayList<Goods> goodsSearchList(GoodsSearch goodsSearch) {
		return goodsDao.goodsSearchList(goodsSearch);
	}


	@Override
	public int categoryAllListCount() {
		return goodsDao.categoryAllListCount();
	}


	@Override
	public ArrayList<Goods> categoryGoodsAllList(Paging p) {
		return goodsDao.categoryGoodsAllList(p);
	}


	@Override
	public ArrayList<Goods> shopMainGoods(Paging p) {
		return goodsDao.shopMainGoods(p);
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
	public int goodsReviewAllListCount(int goodsnum) {
		return goodsDao.goodsReviewAllListCount(goodsnum);
	}


	@Override
	public ArrayList<GoodsReview> selectGoodsReview(GoodsSearch goodsSearch) {
		return goodsDao.selectGoodsReview(goodsSearch);
	}
	
	
}
