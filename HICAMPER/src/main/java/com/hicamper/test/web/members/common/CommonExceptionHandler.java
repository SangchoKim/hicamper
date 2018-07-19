package com.hicamper.test.web.members.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

//���� ����� ��� �缳�� �ʿ� 
@ControllerAdvice("com.hicamper.test.etc")
public class CommonExceptionHandler {

	@ExceptionHandler(Exception.class)
	public String handleException() {
		return "common/error/commonexception";
		
	}
	
	 
		 
	 }

