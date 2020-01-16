package com.c4.intepark.loginInfo.model.vo;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

@Component
public class LoginInfo implements UserDetails, java.io.Serializable{
	private static final long serialVersionUID = 6032L;
	private String logid;
	private String logpwd;
	private String authority;
	private boolean enabled;
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(authority));
        return auth;
	}

	@Override
	public String getPassword() {
		return logpwd;
	}

	@Override
	public String getUsername() {
		return logid;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return enabled;
	}
	
	public LoginInfo() {}

	public LoginInfo(String logid, String logpwd, String authority) {
		super();
		this.logid = logid;
		this.logpwd = logpwd;
		this.authority = authority;
	}

	public String getLogid() {
		return logid;
	}

	public void setLogid(String logid) {
		this.logid = logid;
	}

	public String getLogpwd() {
		return logpwd;
	}

	public void setLogpwd(String logpwd) {
		this.logpwd = logpwd;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "LoginInfo [logid=" + logid + ", logpwd=" + logpwd + ", authority=" + authority + ", enabled=" + enabled
				+ "]";
	}
	
	

	
	
}
