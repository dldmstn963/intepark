package com.c4.intepark.shop.goods.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsList;
import com.c4.intepark.shop.goods.model.vo.GoodsPic;
import com.c4.intepark.shop.goods.model.vo.GoodsSearch;
import com.c4.intepark.shop.goodsreview.model.vo.GoodsReview;

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

	public int searchlistCount(GoodsSearch goodsSearch) {
		return mybatis.selectOne("goodsMapper.goodsSearch",goodsSearch);
	}

	public ArrayList<Goods> goodsSearchList(GoodsSearch goodsSearch) {
		List list = mybatis.selectList("goodsMapper.goodsSearchList",goodsSearch);
		return (ArrayList<Goods>)list; 
	}

	public int categoryAllListCount() {
		return mybatis.selectOne("goodsMapper.categoryAllListCount");
	}

	public ArrayList<Goods> categoryGoodsAllList(Paging p) {
		List list = mybatis.selectList("goodsMapper.categoryGoodsAllList",p);
		return (ArrayList<Goods>)list; 
	}

	public ArrayList<Goods> shopMainGoods(Paging p) {
		List list = mybatis.selectList("goodsMapper.shopMainGoods",p);
		return (ArrayList<Goods>)list; 
	}

	public int selectGoodsNum(Goods goods) {
		return mybatis.selectOne("goodsMapper.selectGoodsNum",goods);
	}

	public int insertGoodsPic(GoodsPic gp) {
		return mybatis.insert("goodsMapper.insertGoodsPic",gp);
	}

	public ArrayList<GoodsPic> selectGoodsPic(int goodsnum) {
		List list = mybatis.selectList("goodsMapper.selectGoodsPic",goodsnum);
		return (ArrayList<GoodsPic>)list; 
	}

	public int goodsReviewAllListCount(int goodsnum) {
		return mybatis.selectOne("goodsMapper.goodsReviewAllListCount",goodsnum);
	}

	public ArrayList<GoodsReview> selectGoodsReview(GoodsSearch goodsSearch) {
		List list = mybatis.selectList("goodsMapper.selectGoodsReview",goodsSearch);
		return (ArrayList<GoodsReview>)list; 
	}
	
}
