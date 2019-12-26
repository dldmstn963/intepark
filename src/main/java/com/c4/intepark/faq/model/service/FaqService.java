package com.c4.intepark.faq.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.c4.intepark.faq.model.vo.Faq;

public interface FaqService {

	ArrayList<Faq> selectall();

	Faq selectOne(int faqno);

	int faqinsert(Faq faq);

	Faq faqUpdate(Faq faq);

	int faqDelete(int faqno);

}
