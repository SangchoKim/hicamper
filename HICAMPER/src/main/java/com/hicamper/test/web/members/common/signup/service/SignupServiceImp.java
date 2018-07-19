package com.hicamper.test.web.members.common.signup.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hicamper.test.web.members.common.Overlapping_signup;
import com.hicamper.test.web.members.common.signup.dao.SignUpDao;

@Transactional(readOnly = true)
@Service
public class SignupServiceImp implements SignUpService {
	
	private static final Logger logger = LoggerFactory.getLogger(SignupServiceImp.class);
	
	int count = 0;
	
	@Autowired
	private SignUpDao signupdao;
	
	@Autowired
	private Overlapping_signup overlapping;
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int hostSignUp(Map map) throws Exception {
		
		count = signupdao.hostSignUp(map);		
		return overlapping.overlap_2(count);
	}

	@Override
	public List hostSignUpView(Map map) {
		List list = signupdao.hostSignUpView(map);
		return null;
	}

	@Override
	public Integer hostCheckID(Map map) {
		return signupdao.hostCheckID(map);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int userSignUp(Map map) throws Exception {
		count = signupdao.userSignUp(map);	
		return overlapping.overlap_2(count);
	}

	@Override
	public List userSignUpView(Map map) {
		List list = signupdao.userSignUpView(map);
		return null;
	}

	@Override
	public Integer userCheckID(Map map) {		
		return signupdao.userCheckID(map);
	}


}
