package com.hicamper.test.web.members.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.web.members.user.service.UserInfoServiceImp;
import com.hicamper.test.web.members.user.sql.UserInfoMapper;

@Repository
public class UserInfoDaoImp implements UserInfoDao{
	
	private static final Logger logger = LoggerFactory.getLogger(UserInfoDaoImp.class);
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List showInfo(Map map) {
	UserInfoMapper userinfomapper = sqlsession.getMapper(UserInfoMapper.class);
		return userinfomapper.showInfo(map);
	}
	
	@Override
	public int updateInfo(Map map) {
		UserInfoMapper userinfomapper = sqlsession.getMapper(UserInfoMapper.class);
		return userinfomapper.updateInfo(map);
	}

	@Override
	public int deleteInfo(Map map) {
		UserInfoMapper userinfomapper = sqlsession.getMapper(UserInfoMapper.class);
		return userinfomapper.deleteInfo(map);
	}
	
}
