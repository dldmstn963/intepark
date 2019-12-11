package com.c4.intepark.shop.dlvylist.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.shop.dlvylist.model.dao.DlvylistDao;
import com.c4.intepark.shop.goods.model.dao.GoodsDao;

@Service("dlvylistService")
public class DlvylistServiceImpl implements DlvylistService{
	
	@Autowired
	private DlvylistDao dlvylistDao;
	
	
}
