package com.c4.intepark.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailHandler implements AuthenticationFailureHandler{
	
	private String logid;
	private String logpwd;
	private String errormessage;
	private String url;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		if(exception instanceof BadCredentialsException) {
			errormessage = "아이디/비밀번호가 일치하지 않습니다.";
        } else if(exception instanceof InternalAuthenticationServiceException) {
        	errormessage = "아이디/비밀번호가 일치하지 않습니다.";
        } else if(exception instanceof DisabledException) {
        	logid = request.getParameter("username");
        	request.setAttribute("logid", logid);
        	errormessage = "정지";
        }
		request.setAttribute("error", errormessage);
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	public LoginFailHandler () {}

	public LoginFailHandler(String logid, String logpwd, String errormessage, String url) {
		super();
		this.logid = logid;
		this.logpwd = logpwd;
		this.errormessage = errormessage;
		this.url = url;
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

	public String getErrormessage() {
		return errormessage;
	}

	public void setErrormessage(String errormessage) {
		this.errormessage = errormessage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "LoginFailHandler [logid=" + logid + ", logpwd=" + logpwd + ", errormessage=" + errormessage + ", url="
				+ url + "]";
	}
	

}
