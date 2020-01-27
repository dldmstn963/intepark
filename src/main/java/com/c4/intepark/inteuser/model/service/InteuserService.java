package com.c4.intepark.inteuser.model.service;

import java.util.ArrayList;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;
import com.c4.intepark.loginInfo.model.vo.LoginMemberState;

public interface InteuserService {
	InteUser selectLoginCheck(InteUser inteuser);
	int insertUser(InteUser inteuser);
	int selectAllListCount(CommonPage cpage);
	ArrayList<InteUser> selectAllList(CommonPage cpage);
	InteUser selectUserDetail(String userid);
	int insertLoginId(LoginInfo loginInfo);
	int updateUser(InteUser inteuser);
	ArrayList<LoginMemberState> selectUserStopState(String userid);
	int selectIdCheck(String logid);
	InteUser selectUserSession(String logid);
}
