package com.c4.intepark.inteuser.model.service;

import com.c4.intepark.inteuser.model.vo.InteUser;

public interface InteuserService {
	InteUser selectLoginCheck(InteUser inteuser);
	int insertUser(InteUser inteuser);
	int selectIdCheck(String userid);
	int selectEmailCheck(String useremail);
}
