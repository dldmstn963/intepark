package com.c4.intepark.shop.goods.model.service;

import java.util.ArrayList;

import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsList;
import com.c4.intepark.shop.goods.model.vo.GoodsPic;
import com.c4.intepark.shop.goods.model.vo.GoodsSearch;
import com.c4.intepark.shop.goodsreview.model.vo.GoodsReview;

public interface GoodsService {
	public int insertGoods(Goods goods);

	public ArrayList<Goods> goodsList(GoodsList goodslist);

	public int listCount(String consid);

	public int deleteGoods(int goodsnum);

	public Goods selectGoods(int goodsnum);

	public int updateGoods(Goods goods);
	
	public int searchlistCount(GoodsSearch goodsSearch);

	public ArrayList<Goods> goodsSearchList(GoodsSearch goodsSearch);

	public int categoryAllListCount();

	public ArrayList<Goods> categoryGoodsAllList(Paging p);

	public ArrayList<Goods> shopMainGoods(Paging p);

	public int selectGoodsNum(Goods goods);

	public int insertGoodsPic(GoodsPic gp);

	public ArrayList<GoodsPic> selectGoodsPic(int goodsnum);

	public int goodsReviewAllListCount(int goodsnum);

	public ArrayList<GoodsReview> selectGoodsReview(GoodsSearch goodsSearch);
}
