package com.c4.intepark.constructors.model.service;

import java.util.ArrayList;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.constructors.model.vo.Constructors;

public interface ConstructorsService {
	Constructors loginCheck(Constructors cons);

	int selectAllListCount(CommonPage cpage);

	ArrayList<Constructors> selectAllList(CommonPage cpage);

	Constructors selectAdConsDetail(String consid);
}
