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

	@Override
	public void updateMemberStop() {
		int result = logDao.updateMemberStop();
	}

	@Override
	public void deleteMember() {
		int result = logDao.deleteMember();
	}

	@Override
	public int selectIdCheck(String logid) {
		return logDao.selectIdCheck(logid);
	}

	@Override
	public int selectEmailCheck(String logemail) {
		return logDao.selectEmailCheck(logemail);
	}

	@Override
	public String selectFindUserId(InteUser inteuser) {
		return logDao.selectFindUserId(inteuser);
	}

	@Override
	public int selectFindUserPwd(LoginInfo loginfo) {
		return logDao.selectFindUserPwd(loginfo);
	}

	@Override
	public void updateNewLogPwd(LoginInfo loginfo) {
		int result = logDao.updateNewLogPwd(loginfo);
	}

	@Override
	public String selectFindConsId(Constructors cons) {
		return logDao.selectFindConsId(cons);
	}

	@Override
	public int insertMemberLetStop(LoginMemberState memberState) {
		return logDao.insertMemberLetStop(memberState);
	}

	@Override
	public int selectMaxStopNo(LoginMemberState memberState) {
		return logDao.selectMaxStopNo(memberState);
	}

	@Override
	public int updateMemberStopRemove(LoginMemberState memberState) {
		return logDao.updateMemberStopRemove(memberState);
	}

	@Override
	public int updateMemberPwd(LoginInfo loginfo) {
		return logDao.updateMemberPwd(loginfo);
	}

	@Override
	public int updateDeleteMember(LoginMemberState logms) {
		return logDao.updateDeleteMember(logms);
	}

	@Override
	public int selectMemberPwdCheck(LoginInfo loginfo) {
		return logDao.selectMemberPwdCheck(loginfo);
	}
}

