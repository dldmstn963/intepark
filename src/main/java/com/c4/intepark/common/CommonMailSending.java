package com.c4.intepark.common;

import java.util.Properties;

import javax.mail.internet.MimeMessage;

import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

public class CommonMailSending {


	@Bean
	public JavaMailSender getJavaMailSender() {
	    JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	    mailSender.setHost("smtp.gmail.com");
	    mailSender.setPort(587);
	      
	    mailSender.setUsername("dldudtn118@gmail.com");
	    mailSender.setPassword("");
	      
	    Properties props = mailSender.getJavaMailProperties();
	    props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.debug", "true");
	      
	    return mailSender;
	}
	
	public void mailSending(String tomail, String name, String logid) throws Exception{
		JavaMailSender mailSender = new CommonMailSending().getJavaMailSender();
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,
				true, "UTF-8");
		String title = name+"님의 인테파크 아이디 찾기 결과입니다.";
		String content = name+"님의 인테파크 아이디는 : "+logid+" 입니다.";
		messageHelper.setFrom("dldudtn118@gamil.com"); // 보내는사람 생략하면 정상작동을 안함
		messageHelper.setTo(tomail); // 받는사람 이메일
		messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		messageHelper.setText(content); // 메일 내용
		
		mailSender.send(message);
	}
	
	public void mailSending2(String tomail, String logid, String logpwd) throws Exception{
		JavaMailSender mailSender = new CommonMailSending().getJavaMailSender();
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,
				true, "UTF-8");
		String title = logid+"님의 인테파크 임시비밀번호가 발행되었습니다.";
		String content = logid+"님의 인테파크 임시비밀번호는 : "+logpwd+" 입니다.";
		messageHelper.setFrom("dldudtn118@gamil.com"); // 보내는사람 생략하면 정상작동을 안함
		messageHelper.setTo(tomail); // 받는사람 이메일
		messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		messageHelper.setText(content); // 메일 내용
		
		mailSender.send(message);
	}

}
