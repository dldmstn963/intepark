package com.c4.intepark.shop.goods.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.shop.goods.model.dao.GoodsDao;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsList;

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
	
	
}
