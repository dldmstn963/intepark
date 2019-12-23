package com.c4.intepark.portfolio.model.service;

import java.util.ArrayList;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.portfolio.model.vo.PortfolioFile;

public interface PortfolioService {
	ArrayList<Constructors> selectList();
	Constructors selectOneCons(String consid);
	int insertportfolio(Portfolio portfolio);
	int selectpfnum();
	int insertportfolioFile(PortfolioFile portfolioFile);
	int updateportfolio(Portfolio portfolio);
	int deleteportfolio(String reqnum);
	
}
