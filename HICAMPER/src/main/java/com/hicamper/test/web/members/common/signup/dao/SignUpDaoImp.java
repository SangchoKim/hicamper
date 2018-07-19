package com.hicamper.test.web.members.common.signup.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.web.members.common.signup.sql.SignUpMapper;

@Repository
public class SignUpDaoImp implements SignUpDao {
	
	private static final Logger logger = LoggerFactory.getLogger(SignUpDaoImp.class);
	
	@Autowired
	private SqlSession sqlsession;
		
	@Override
	public int hostSignUp(Map map) throws Exception {
		SignUpMapper mapper	= sqlsession.getMapper(SignUpMapper.class);
		return mapper.hostSignUp(map);
	}
	
	@Override
	public Integer hostCheckID(Map map) {
		SignUpMapper mapper	= sqlsession.getMapper(SignUpMapper.class);
		return mapper.hostCheckID(map);
	}
	
	@Override
	public List hostSignUpView(Map map) {
		SignUpMapper mapper	= sqlsession.getMapper(SignUpMapper.class);
		return mapper.hostSignUpView(map);
	}

	@Override
	public int userSignUp(Map map) throws Exception {
		SignUpMapper mapper	= sqlsession.getMapper(SignUpMapper.class);
		return mapper.userSignUp(map);
	}

	
	@Override
	public List userSignUpView(Map map) {
		SignUpMapper mapper	= sqlsession.getMapper(SignUpMapper.class);	
		return mapper.hostSignUpView(map);
	}

	@Override
	public Integer userCheckID(Map map) {
		SignUpMapper mapper	= sqlsession.getMapper(SignUpMapper.class);	
		return mapper.userCheckID(map);
	}


	

}
