package com.hicamper.test.web.members.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.web.members.user.sql.UserMapper;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List getAllUser(Map map) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.getAllUser(map);
	}
	
}
