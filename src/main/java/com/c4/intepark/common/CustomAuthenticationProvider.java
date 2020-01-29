package com.c4.intepark.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.c4.intepark.loginInfo.model.service.LoginInfoServiceImpl;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	private LoginInfoServiceImpl logService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
	      String username = (String) authentication.getPrincipal();
	        String password = (String) authentication.getCredentials();
	        
	        LoginInfo user = (LoginInfo) logService.loadUserByUsername(username);
	        
	        if(password.equals(user.getPassword())) {//같다면 암호화안된것. 암호화시켜줌
	        	LoginInfo loginfo = new LoginInfo();
	        	loginfo.setLogid(username);
	        	loginfo.setLogpwd(bcryptPasswordEncoder.encode(user.getPassword()));   	
	        	logService.updateMemberPwd(loginfo);
	        }else {
	        	boolean pcheck = bcryptPasswordEncoder.matches(password, user.getPassword());
	        	if(!pcheck) {
	        		throw new BadCredentialsException("아이디/암호를 확인해주세요.");
	        	}
	        }
	        
	 
	        if(!user.isEnabled()) {
	            throw new BadCredentialsException(username);
	        }
	        UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
	        result.setDetails(user);
	        return result;
	    
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
	
}
