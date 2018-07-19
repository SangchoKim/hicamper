package com.hicamper.test.web.members.admin.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hicamper.test.web.members.admin.dao.adminDao;

@Service
@Transactional(readOnly = true)
public class adminServiceImp implements adminService {
	
	private static final Logger logger = LoggerFactory.getLogger(adminServiceImp.class);
	
	@Autowired
	private adminDao admindao;

	@Override
	public List HostList(Map map) {
		return admindao.HostList(map);
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int countHostList(Map map) {
		return admindao.countHostList(map);
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int ad_deleteHost(Map map) {
		return admindao.ad_deleteHost(map);
	}
	
	@Override
	public List UserList(Map map) {
		return admindao.UserList(map);
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int countUserList(Map map) {
		return admindao.countUserList(map);
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int ad_deleteUser(Map map) {
		return admindao.ad_deleteUser(map);
	}

	
	@Override
	public List BookingList(Map map) {
		return admindao.BookingList(map);
	}
	@Override
	public int countBookingList(Map map) {
		return admindao.countBookingList(map);
	}
	@Override
	public int countBooking(Map map) {
		return admindao.countBooking(map);
	}
	@Override
	public int countcancelBooking(Map map) {
		return admindao.countcancelBooking(map);
	}
	
	@Override
	public List boardList(Map map) {
		return admindao.boardList(map);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int countBoardList(Map map) {
		return admindao.countBoardList(map);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int deleteBoard(Map map) {
		return admindao.deleteBoard(map);
	}

}
