package com.c4.intepark.inteuser.model.service;

import java.util.ArrayList;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;

public interface InteuserService {
	InteUser selectLoginCheck(InteUser inteuser);
	int insertUser(InteUser inteuser);
	int selectIdCheck(String userid);
	int selectEmailCheck(String useremail);
	int selectAllListCount(CommonPage cpage);
	ArrayList<InteUser> selectAllList(CommonPage cpage);
	InteUser selectAdUserDetail(String userid);
	int insertLoginId(LoginInfo loginInfo);
}
