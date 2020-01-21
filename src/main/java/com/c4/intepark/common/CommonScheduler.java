package com.c4.intepark.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.c4.intepark.loginInfo.model.service.LoginInfoService;

@Component
public class CommonScheduler {
	
	@Autowired
	private LoginInfoService logService;
	
	@Scheduled(cron = "1 0 0/6 * * *")
	public void updateMemberState() {
		System.out.println("멤버관리 스케쥴러 시작");
		logService.updateMemberStop();
		logService.deleteMember();
	}

}
