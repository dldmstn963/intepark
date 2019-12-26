package com.c4.intepark.faq.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.faq.model.vo.Faq;
import com.c4.intepark.faq.model.service.FaqService;
import com.c4.intepark.faq.model.dao.FaqDao;

@Service("faqService")
public class FaqServiceImpl implements FaqService{
	public FaqServiceImpl() {}
	
	@Autowired
	private FaqDao faqDao;

	@Override
	public ArrayList<Faq> selectall() {
		// TODO Auto-generated method stub
		return faqDao.selectAll();
	}

	@Override
	public Faq selectOne(int faqno) {
		// TODO Auto-generated method stub
		return faqDao.selectOne(faqno);
	}

	@Override
	public int faqinsert(Faq faq) {
		// TODO Auto-generated method stub
		return faqDao.faqinsert(faq);
	}

	@Override
	public Faq faqUpdate(Faq faq) {
		// TODO Auto-generated method stub
		return faqDao.faqUpdate(faq);
	}

	@Override
	public int faqDelete(int faqno) {
		// TODO Auto-generated method stub
		return faqDao.faqDelete(faqno);
	}

}







