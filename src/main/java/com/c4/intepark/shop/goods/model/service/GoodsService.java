package com.c4.intepark.shop.goods.model.service;

import java.util.ArrayList;

import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsList;

public interface GoodsService {
	public int insertGoods(Goods goods);

	public ArrayList<Goods> goodsList(GoodsList goodslist);

	public int listCount(String consid);

	public int deleteGoods(int goodsnum);

	public Goods selectGoods(int goodsnum);

	public int updateGoods(Goods goods);
}
