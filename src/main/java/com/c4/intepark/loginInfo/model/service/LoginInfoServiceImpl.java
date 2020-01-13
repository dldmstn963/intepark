package com.c4.intepark.loginInfo.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.loginInfo.model.dao.LoginInfoDao;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;
import com.c4.intepark.loginInfo.model.vo.LoginMemberState;

@Service("logService")
public class LoginInfoServiceImpl implements UserDetailsService,LoginInfoService{
	
	@Autowired
	private LoginInfoDao logDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		LoginInfo user = logDao.getUserById(username);
		if(user==null) {
			throw new UsernameNotFoundException(username);
		}
		return user;
	}

	@Override
	public Constructors selectConsSession(String name) {
		return logDao.selectConsSession(name);
	}

	@Override
	public InteUser selectUserSession(String name) {
		return logDao.selectUserSession(name);
	}

	@Override
	public LoginMemberState selectMemberState(String logid) {
		return logDao.selectMemberState(logid);
	}
}

