package com.c4.intepark.shop.goods.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsList;

@Repository("goodsDao")
public class GoodsDao {
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public GoodsDao() {}

	public int insertGoods(Goods goods) {
		return mybatis.insert("goodsMapper.insertGoods",goods);
	}

	public ArrayList<Goods> listGoods(GoodsList goodslist) {
		List list = mybatis.selectList("goodsMapper.listGoods",goodslist);
		return (ArrayList<Goods>)list; 
	}

	public int listCount(String consid) {
		return mybatis.selectOne("goodsMapper.listCount",consid);
	}

	public int deleteGoods(int goodsnum) {
		return mybatis.delete("goodsMapper.deleteGoods",goodsnum);
	}

	public Goods selectGoods(int goodsnum) {
		return mybatis.selectOne("goodsMapper.selectGoods",goodsnum);
	}

	public int updateGoods(Goods goods) {
		return mybatis.update("goodsMapper.updateGoods",goods);
	}
	
}
