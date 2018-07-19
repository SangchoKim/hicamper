package com.hicamper.test.web.members.host.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.web.members.host.sql.HostBookingMapper;

@Repository
public class HostBookingDaoImp implements HostBookingDao {

	private static final Logger logger = LoggerFactory.getLogger(HostBookingDaoImp.class);
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List showHostBooking(Map map) {
	HostBookingMapper mapper = sqlsession.getMapper(HostBookingMapper.class);
		return mapper.showHostBooking(map);
	}

	@Override
	public List showUserDetails(Map map) {
	HostBookingMapper mapper = sqlsession.getMapper(HostBookingMapper.class);
		return mapper.showUserDetails(map);
	}

	@Override
	public List showUserInfoFromUser(Map map) {
	HostBookingMapper mapper = sqlsession.getMapper(HostBookingMapper.class);
		return mapper.showUserInfoFromUser(map);
	}

}
