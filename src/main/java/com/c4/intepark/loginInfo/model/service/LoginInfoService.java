package com.c4.intepark.loginInfo.model.service;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;
import com.c4.intepark.loginInfo.model.vo.LoginMemberState;

public interface LoginInfoService {

	Constructors selectConsSession(String name);

	InteUser selectUserSession(String name);

	LoginMemberState selectMemberState(String logid);

	void updateMemberStop();

	void deleteMember();

	int selectIdCheck(String logid);

	int selectEmailCheck(String logemail);

	String selectFindUserId(InteUser inteuser);

	int selectFindUserPwd(LoginInfo loginfo);

	void updateNewLogPwd(LoginInfo loginfo);

	String selectFindConsId(Constructors cons);

	int insertMemberLetStop(LoginMemberState memberState);

	int selectMaxStopNo(LoginMemberState memberState);

	int updateMemberStopRemove(LoginMemberState memberState);

	int updateMemberPwd(LoginInfo loginfo);

	int updateDeleteMember(LoginMemberState logms);

	String selectMemberPwdCheck(LoginInfo loginfo);

}
