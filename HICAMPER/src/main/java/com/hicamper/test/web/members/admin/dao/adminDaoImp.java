package com.hicamper.test.web.members.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.web.members.admin.sql.adminMapper;


@Repository("adminDao")
public class adminDaoImp implements adminDao {
	
	private static final Logger logger = LoggerFactory.getLogger(adminDaoImp.class);
	
	@Autowired
	SqlSession sqlsession;

	@Override
	public List HostList(Map map) {
		adminMapper mapper = sqlsession.getMapper(adminMapper.class);
		return mapper.HostList(map);
	}
	@Override
	public int countHostList(Map map) {
		adminMapper mapper = sqlsession.getMapper(adminMapper.class);
		return mapper.countHostList(map);
	}
	@Override
	public int ad_deleteHost(Map map) {
		adminMapper mapper = sqlsession.getMapper(adminMapper.class);
		return mapper.ad_deleteHost(map);
	}
	
	
	@Override
	public List UserList(Map map) {
		adminMapper mapper = sqlsession.getMapper(adminMapper.class);
		return mapper.UserList(map);
	}
	@Override
	public int countUserList(Map map) {
		adminMapper mapper = sqlsession.getMapper(adminMapper.class);
		return mapper.countUserList(map);
	}
	@Override
	public int ad_deleteUser(Map map) {
		adminMapper mapper = sqlsession.getMapper(adminMapper.class);
		return mapper.ad_deleteUser(map);
	}
	
	
	@Override
	public List BookingList(Map map) {
		adminMapper mapper = sqlsession.getMapper(adminMapper.class);
		return mapper.BookingList(map);
	}
	@Override
	public int countBookingList(Map map) {
		adminMapper mapper = sqlsession.getMapper(adminMapper.class);
		return mapper.countBookingList(map);
	}
	@Override
	public int countBooking(Map map) {
		adminMapper mapper = sqlsession.getMapper(adminMapper.class);
		return mapper.countBooking(map);
	}
	@Override
	public int countcancelBooking(Map map) {
		adminMapper mapper = sqlsession.getMapper(adminMapper.class);
		return mapper.countcancelBooking(map);
	}
	


	@Override
	public List boardList(Map map) {
		adminMapper mapper = sqlsession.getMapper(adminMapper.class);
		return mapper.boardList(map);
	}
	
	@Override
	public int countBoardList(Map map) {
		adminMapper mapper = sqlsession.getMapper(adminMapper.class);
		return mapper.countBoardList(map);
	}

	@Override
	public int deleteBoard(Map map) {
		adminMapper mapper = sqlsession.getMapper(adminMapper.class);
		return mapper.deleteBoard(map);
	}


}
