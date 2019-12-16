package com.c4.intepark.portfolio.model.service;

import java.util.ArrayList;

import com.c4.intepark.constructors.model.vo.Constructors;

public interface PortfolioService {
	ArrayList<Constructors> selectList();
	Constructors selectOneCons(String consid);
	Constructors selectRequest(String consid);
	
}
