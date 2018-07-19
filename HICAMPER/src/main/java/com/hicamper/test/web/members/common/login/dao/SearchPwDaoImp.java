package com.hicamper.test.web.members.common.login.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.web.members.common.login.sql.SearchPwMapper;


@Repository
public class SearchPwDaoImp implements SearchPwDao {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchPwDaoImp.class);
	
	@Autowired
	private SqlSession sqlsession;
	
	public List checkHostID(Map map) {
		SearchPwMapper searchpwmapper = sqlsession.getMapper(SearchPwMapper.class);
		return searchpwmapper.checkHostID(map);
	}
	
	public int changeHostPW(Map map) {
		SearchPwMapper searchpwmapper = sqlsession.getMapper(SearchPwMapper.class);
		return searchpwmapper.changeHostPW(map);
	}
	
	public List checkUserID(Map map) {
		SearchPwMapper searchpwmapper = sqlsession.getMapper(SearchPwMapper.class);
		return searchpwmapper.checkUserID(map);
	}
	
	public int changeUserPW(Map map) {
		SearchPwMapper searchpwmapper = sqlsession.getMapper(SearchPwMapper.class);
		return searchpwmapper.changeUserPW(map);
	}
	
}
