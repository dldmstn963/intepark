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
	int selectUserPwdCheck(LoginInfo loginfo);
	int updateUserPwd(LoginInfo loginfo);
	int updateDeleteUser(LoginMemberState logms);
	ArrayList<LoginMemberState> selectUserStopState(String userid);
	int insertUserLetStop(LoginMemberState userState);
	int updateUserStopRemove(LoginMemberState userState);
	int selectMaxStopNo(LoginMemberState userState);
}
