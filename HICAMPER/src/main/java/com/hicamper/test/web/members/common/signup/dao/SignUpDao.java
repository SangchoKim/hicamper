package com.hicamper.test.web.members.common.signup.dao;

import java.util.List;
import java.util.Map;

public interface SignUpDao {

	public int hostSignUp(Map map) throws Exception;
		
	public Integer hostCheckID(Map map);
	
	public List hostSignUpView(Map map);
	
	public int userSignUp(Map map) throws Exception;
	
	public List userSignUpView(Map map);
	
	public Integer userCheckID(Map map);
}
