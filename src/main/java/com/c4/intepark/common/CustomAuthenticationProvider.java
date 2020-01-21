package com.c4.intepark.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import com.c4.intepark.loginInfo.model.service.LoginInfoServiceImpl;
import com.c4.intepark.loginInfo.model.vo.LoginInfo;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	private LoginInfoServiceImpl logService;
	
	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
	      String username = (String) authentication.getPrincipal();
	        String password = (String) authentication.getCredentials();
	        
	        LoginInfo user = (LoginInfo) logService.loadUserByUsername(username);
	        
	        if(!matchPassword(password, user.getPassword())) {
	            throw new BadCredentialsException(username);
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
	
    private boolean matchPassword(String loginPwd, String password) {
        return loginPwd.equals(password);
    }
	
}
