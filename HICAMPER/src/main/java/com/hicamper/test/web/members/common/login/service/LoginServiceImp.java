package com.hicamper.test.web.members.common.login.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hicamper.test.web.members.common.login.service.LoginServiceImp;
import com.hicamper.test.web.members.common.login.dao.LoginDao;

@Service
public class LoginServiceImp implements LoginService {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginServiceImp.class);
	
	@Autowired
	private LoginDao logindao;
	
	@Override
	public Map hostLoginID(Map map) {
		System.out.println("Service : " + map);
		return logindao.hostLoginID(map);
	}
	
	@Override
	public Map userLoginID(Map map) {
		System.out.println("Service : " + map);
		return logindao.userLoginID(map);
	}
	

}
