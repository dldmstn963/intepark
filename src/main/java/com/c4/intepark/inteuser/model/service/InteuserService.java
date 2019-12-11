package com.c4.intepark.inteuser.model.service;

import com.c4.intepark.inteuser.model.vo.InteUser;

public interface InteuserService {
	InteUser loginCheck(InteUser inteuser);
	int insertUser(InteUser inteuser);
}
