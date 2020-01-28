package com.c4.intepark.constructors.model.service;

import java.util.ArrayList;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;
import com.c4.intepark.loginInfo.model.vo.LoginMemberState;

public interface ConstructorsService {
	Constructors loginCheck(Constructors cons);

	int selectAllListCount(CommonPage cpage);

	ArrayList<Constructors> selectAllList(CommonPage cpage);

	Constructors selectConsDetail(String consid);

	int insertLoginId(LoginInfo loginInfo);

	int insertCons(Constructors cons);

	ArrayList<LoginMemberState> selectConsStopState(String consid);

	int updateConsApproval(String consid);

	int deleteConsRefuse(String consid);

	int updateCons(Constructors cons);
}
