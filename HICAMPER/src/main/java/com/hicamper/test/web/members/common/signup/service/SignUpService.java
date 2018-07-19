package com.hicamper.test.web.members.common.signup.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface SignUpService {
	
	@Transactional
	public int hostSignUp(Map map) throws Exception;
	
	public List hostSignUpView(Map map);
	
	public Integer hostCheckID(Map map);
	
	@Transactional
	public int userSignUp(Map map) throws Exception;
	
	public List userSignUpView(Map map);
	
	public Integer userCheckID(Map map);
}
