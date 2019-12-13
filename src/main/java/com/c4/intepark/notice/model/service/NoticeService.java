package com.c4.intepark.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.c4.intepark.notice.model.vo.Notice;

public interface NoticeService {
 
	ArrayList<Notice> selectAll();

	



}
