package com.hicamper.test.web.members.common.signup.sql;

import java.util.List;
import java.util.Map;

public interface SignUpMapper {

public int hostSignUp(Map map) throws Exception;
	
	public List hostSignUpView(Map map);
		
	public Integer hostCheckID(Map map);
	
	public int userSignUp(Map map) throws Exception;
	
	public List userSignUpView(Map map);
	
	public Integer userCheckID(Map map);

	
}
