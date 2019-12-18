package com.c4.intepark.shop.goods.model.service;

import java.util.ArrayList;

import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsList;
import com.c4.intepark.shop.goods.model.vo.GoodsSearch;

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
}
