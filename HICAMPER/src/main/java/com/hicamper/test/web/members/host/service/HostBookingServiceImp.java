package com.hicamper.test.web.members.host.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hicamper.test.web.members.host.dao.HostBookingDao;

@Service
public class HostBookingServiceImp implements HostBookingService {

	private static final Logger logger = LoggerFactory.getLogger(HostBookingServiceImp.class);
	
	@Autowired
	HostBookingDao dao;
	
	@Override
	public List showHostBooking(Map map) {
		return dao.showHostBooking(map);
	}

	@Override
	public List showUserDetails(Map map) {
		return dao.showUserDetails(map);
	}

	@Override
	public List showUserInfoFromUser(Map map) {
		return dao.showUserInfoFromUser(map);
	}

}
