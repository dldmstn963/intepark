package com.c4.intepark.portfolio.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.portfolio.model.vo.PortfolioFile;
import com.c4.intepark.portfolio.model.vo.PortfolioView;
import com.c4.intepark.review.model.vo.Review;
import com.c4.intepark.review.model.vo.ReviewFile;
import com.c4.intepark.review.model.vo.RvAvg;

@Repository("portfolioDao")
public class PortfolioDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public PortfolioDao() {}

	public ArrayList<Constructors> selectList() {
		List<Constructors> list = mybatisSession.selectList("portfolioMapper.selectList");
		return (ArrayList<Constructors>)list;
	}
	
	public ArrayList<RvAvg> selectAllReview() {
		List<RvAvg> list = mybatisSession.selectList("portfolioMapper.selectAllReview");
		return (ArrayList<RvAvg>)list;
	}
	
	public ArrayList<Portfolio> selectPfPhotoList() {
		List<Portfolio>pfPhotoList = mybatisSession.selectList("portfolioMapper.selectPfPhotoList");
		return (ArrayList<Portfolio>)pfPhotoList;
	}
	
	public Constructors selectOneCons(String consid) {
		return mybatisSession.selectOne("portfolioMapper.selectOneCons", consid);
	}
	
	public RvAvg selectReview(String consid) {
		return mybatisSession.selectOne("portfolioMapper.selectReview", consid);
	}
	
	public ArrayList<Review> selectConsReviewList(String consid) {
		List<Review>review = mybatisSession.selectList("portfolioMapper.selectConsReviewList", consid);
		return (ArrayList<Review>)review;
	}
	
	public ArrayList<ReviewFile> selectConsRvFileList(String consid) {
		List<ReviewFile>rvFile = mybatisSession.selectList("portfolioMapper.selectConsRvFileList", consid);
		return (ArrayList<ReviewFile>)rvFile;
	}
	
	public int updateIntroduction(Constructors cons) {
		return mybatisSession.update("portfolioMapper.updateIntroduction", cons);
	}
	
	public ArrayList<PortfolioFile> selectPfOne(int pfnum) {
		List<PortfolioFile>PfOne = mybatisSession.selectList("portfolioMapper.selectPfOne", pfnum);
		return (ArrayList<PortfolioFile>)PfOne;
	}
	
	public ArrayList<PortfolioView> selectPfOneList(String consid) {
		List<PortfolioView>pfOneList = mybatisSession.selectList("portfolioMapper.selectPfOneList", consid);
		return (ArrayList<PortfolioView>)pfOneList;
	}
	
	public ArrayList<PortfolioFile> selectPfRename(int pfnum) {
		List<PortfolioFile>pfFile = mybatisSession.selectList("portfolioMapper.selectPfRename", pfnum);
		return (ArrayList<PortfolioFile>)pfFile;
	}
	
	public int deletePortfolio(int pfnum) {
		return mybatisSession.delete("portfolioMapper.deletePortfolio", pfnum);
	}

	public int insertPF(Portfolio pf) {
		return mybatisSession.insert("portfolioMapper.insertPF", pf);
	}

	public int selectpfnum(String consid) {
		return mybatisSession.selectOne("portfolioMapper.selectpfnum", consid);
	}

	public int insertPfFile(PortfolioFile p) {
		return mybatisSession.insert("portfolioMapper.insertPfFile", p);
	}

	public Portfolio selectpfTitle(int pfnum) {
		return mybatisSession.selectOne("portfolioMapper.selectpfTitle", pfnum);
	}

	public int updatePfTitle(Portfolio pf) {
		return mybatisSession.update("portfolioMapper.updatePfTitle", pf);
	}

	public void updatePfComent(PortfolioFile pff) {
		mybatisSession.update("portfolioMapper.updatePfComent", pff);
	}

	public void deletePfFile(int pfphotonum) {
		mybatisSession.delete("portfolioMapper.deletePfFile", pfphotonum);
		
	}


	
	

	
}



