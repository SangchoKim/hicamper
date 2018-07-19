package com.hicamper.test.web.members.common.login.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.web.members.common.login.sql.LoginMapper;

@Repository
public class LoginDaoImp implements LoginDao {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginDaoImp.class);
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public Map hostLoginID(Map map) {
		System.out.println("Dao : " + map);
		LoginMapper mapper	= sqlsession.getMapper(LoginMapper.class);
		return mapper.hostLoginID(map);
	}

	@Override
	public Map userLoginID(Map map) {
		System.out.println("Dao : " + map);
		LoginMapper mapper	= sqlsession.getMapper(LoginMapper.class);
		return mapper.userLoginID(map);
	}
	
/*	@Override
	public String hostLoginPassword(String string) {
		LoginMapper mapper	= sqlsession.getMapper(LoginMapper.class);
		return mapper.hostLoginPassword(string);
	}
*/	
/*	@Override
	public int userLoginForm(Map map) {
		LoginMapper mapper	= sqlsession.getMapper(LoginMapper.class);
		return mapper.userLoginForm(map);
	}

	@Override
	public int userLogin(Map map) {
		LoginMapper mapper	= sqlsession.getMapper(LoginMapper.class);
		return mapper.userLogin(map);
	}*/

}
