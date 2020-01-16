package com.c4.intepark.loginInfo.model.service;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.loginInfo.model.vo.LoginMemberState;

public interface LoginInfoService {

	Constructors selectConsSession(String name);

	InteUser selectUserSession(String name);

	LoginMemberState selectMemberState(String logid);

}
