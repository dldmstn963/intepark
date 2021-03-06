package com.c4.intepark.shop.goods.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsPic;
import com.c4.intepark.shop.goods.model.vo.GoodsReview;
import com.c4.intepark.shop.goods.model.vo.GoodsSearch;
import com.c4.intepark.shop.goods.model.vo.Inquiry;

@Repository("goodsDao")
public class GoodsDao {
	@Autowired
	private SqlSessionTemplate mybatis;

	public GoodsDao() {
	}

	public int insertGoods(Goods goods) {
		return mybatis.insert("goodsMapper.insertGoods", goods);
	}

	public ArrayList<Goods> selectgoodsList(GoodsSearch goodssearch) {
		List list = mybatis.selectList("goodsMapper.selectgoodsList", goodssearch);
		return (ArrayList<Goods>) list;
	}

	public int selectlistCount(String consid) {
		return mybatis.selectOne("goodsMapper.selectlistCount", consid);
	}

	public int deleteGoods(int goodsnum) {
		return mybatis.delete("goodsMapper.deleteGoods", goodsnum);
	}

	public Goods selectGoods(int goodsnum) {
		return mybatis.selectOne("goodsMapper.selectGoods", goodsnum);
	}

	public int updateGoods(Goods goods) {
		return mybatis.update("goodsMapper.updateGoods", goods);
	}

	public int selectsearchlistCount(GoodsSearch goodsSearch) {
		return mybatis.selectOne("goodsMapper.selectsearchlistCount", goodsSearch);
	}

	public ArrayList<Goods> selectgoodsSearchList(GoodsSearch goodsSearch) {
		List list = mybatis.selectList("goodsMapper.selectgoodsSearchList", goodsSearch);
		return (ArrayList<Goods>) list;
	}

	public int selectcategoryAllListCount() {
		return mybatis.selectOne("goodsMapper.selectcategoryAllListCount");
	}

	public ArrayList<Goods> selectcategoryGoodsAllList(Paging p) {
		List list = mybatis.selectList("goodsMapper.selectcategoryGoodsAllList", p);
		return (ArrayList<Goods>) list;
	}

	public ArrayList<Goods> selectshopMainGoods(Paging p) {
		List list = mybatis.selectList("goodsMapper.selectshopMainGoods", p);
		return (ArrayList<Goods>) list;
	}

	public int selectGoodsNum(Goods goods) {
		return mybatis.selectOne("goodsMapper.selectGoodsNum", goods);
	}

	public int insertGoodsPic(GoodsPic gp) {
		return mybatis.insert("goodsMapper.insertGoodsPic", gp);
	}

	public ArrayList<GoodsPic> selectGoodsPic(int goodsnum) {
		List list = mybatis.selectList("goodsMapper.selectGoodsPic", goodsnum);
		return (ArrayList<GoodsPic>) list;
	}

	public int selectgoodsReviewAllListCount(int goodsnum) {
		return mybatis.selectOne("goodsMapper.selectgoodsReviewAllListCount", goodsnum);
	}

	public ArrayList<GoodsReview> selectGoodsReview(GoodsSearch goodsSearch) {
		List list = mybatis.selectList("goodsMapper.selectGoodsReview", goodsSearch);
		return (ArrayList<GoodsReview>) list;
	}

	public int selectgoodsInquiryAllListCount(int goodsnum) {
		return mybatis.selectOne("goodsMapper.selectgoodsInquiryAllListCount", goodsnum);
	}

	public ArrayList<Inquiry> selectGoodsInquiry(GoodsSearch goodsSearch) {
		List list = mybatis.selectList("goodsMapper.selectGoodsInquiry", goodsSearch);
		return (ArrayList<Inquiry>) list;
	}

	public int insertGoodsInquiry(Inquiry goodsinquiry) {
		return mybatis.insert("goodsMapper.insertGoodsInquiry", goodsinquiry);
	}

	public int insertGoodsReview(GoodsReview goodsreview) {
		return mybatis.insert("goodsMapper.insertGoodsReview", goodsreview);
	}

	public int selectcategoryListCount(int categorynum) {
		return mybatis.selectOne("goodsMapper.selectcategoryListCount", categorynum);
	}

	public ArrayList<Goods> selectcategoryGoodsList(GoodsSearch goodsSearch) {
		List list = mybatis.selectList("goodsMapper.selectcategoryGoodsList", goodsSearch);
		return (ArrayList<Goods>) list;
	}

	public int insertReviewPic(GoodsPic gp) {
		return mybatis.insert("goodsMapper.insertReviewPic", gp);
	}

	public int selectGoodsReviewNum() {
		return mybatis.selectOne("goodsMapper.selectGoodsReviewNum");
	}

	public GoodsReview selectGoodsReviewDetail(int reviewnum) {
		return mybatis.selectOne("goodsMapper.selectGoodsReviewDetail", reviewnum);
	}

	public ArrayList selectGoodsReviewDetailPic(int reviewnum) {
		List list = mybatis.selectList("goodsMapper.selectGoodsReviewDetailPic", reviewnum);
		return (ArrayList<GoodsReview>) list;
	}

	public float selectreviewscore(int goodsnum) {
		return mybatis.selectOne("goodsMapper.selectreviewscore", goodsnum);
	}

	public int selectGoodsInquiryNum() {
		return mybatis.selectOne("goodsMapper.selectGoodsInquiryNum");
	}

	public int insertInquiryPic(GoodsPic gp) {
		return mybatis.insert("goodsMapper.insertInquiryPic", gp);
	}

	public Inquiry selectGoodsInquiryDetail(int inquirynum) {
		return mybatis.selectOne("goodsMapper.selectGoodsInquiryDetail", inquirynum);
	}

	public ArrayList<Inquiry> selectGoodsInquiryDetailPic(int inquirynum) {
		List list = mybatis.selectList("goodsMapper.selectGoodsInquiryDetailPic", inquirynum);
		return (ArrayList<Inquiry>) list;
	}

	public int deleteInquiry(int inquirynum) {
		return mybatis.delete("goodsMapper.deleteInquiry", inquirynum);
	}

	public int deleteInquiryPic(int inquirynum) {
		return mybatis.delete("goodsMapper.deleteInquiryPic", inquirynum);
	}

	public int deleteReview(int reviewnum) {
		return mybatis.delete("goodsMapper.deleteReview", reviewnum);
	}

	public int deleteReviewPic(int reviewnum) {
		return mybatis.delete("goodsMapper.deleteReviewPic", reviewnum);
	}

	public ArrayList<Goods> selectgoodsList(String consid) {
		List list = mybatis.selectList("goodsMapper.selectgoodsList2", consid);;
		return (ArrayList<Goods>) list;
	}

	public int insertGoodsAnswer(Inquiry inquiry) {
		return mybatis.insert("goodsMapper.insertGoodsAnswer", inquiry);
	}

	public int updateGoodsAnswer(int inquirynum) {
		return mybatis.update("goodsMapper.updateGoodsAnswer", inquirynum);
	}

	public Inquiry selectGoodsInquiryAnswer(int inquirynum) {
		return mybatis.selectOne("goodsMapper.selectGoodsInquiryAnswer", inquirynum);
	}

	public int updateGoodsInquiryAnswer4(Inquiry in) {
		return mybatis.update("goodsMapper.updateGoodsInquiryAnswer4",  in);
	}

	public int selectcountInquiry(String consid) {
		return mybatis.selectOne("goodsMapper.selectcountInquiry", consid);
	}

	public int selectcountOrders(String consid) {
		return mybatis.selectOne("goodsMapper.selectcountOrders", consid);
	}

	public int selectcountallOrders(String consid) {
		return mybatis.selectOne("goodsMapper.selectcountallOrders", consid);
	}

	public int selectcountallOrdersPrice(String consid) {
		return mybatis.selectOne("goodsMapper.selectcountallOrdersPrice", consid);
	}

	public ArrayList<Inquiry> selectNoanswerInquiryList(String consid) {
		List list = mybatis.selectList("goodsMapper.selectNoanswerInquiryList", consid);;
		return (ArrayList<Inquiry>) list;
	}

}
