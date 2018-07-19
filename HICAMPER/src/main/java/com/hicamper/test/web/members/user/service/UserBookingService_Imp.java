package com.hicamper.test.web.members.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hicamper.test.web.members.user.Overlapping_user;
import com.hicamper.test.web.members.user.dao.UserBooking_Dao;

@Transactional(readOnly=true)
@Service
public class UserBookingService_Imp implements UserBooking_Service{

	private static final Logger logger = LoggerFactory.getLogger(UserBookingService_Imp.class);
	
	@Autowired
	private UserBooking_Dao userbookingdao;
	
	@Autowired
	private Overlapping_user overlapping;
	
	Map map = new HashMap();
	
	@Override
	public List showbookingpage(Map map) {
		return userbookingdao.showbookingpage(map);
	}
	
	@Override
	public List showUserReview(Map map) {
		return userbookingdao.showUserReview(map);
	}
	
	@Override
	public List bookingInProgress(Map map) {
		return userbookingdao.bookingInProgress(map);
	}
	
	@Override
	public List bookingInProgress_1(Map map) {	
		return userbookingdao.bookingInProgress_1(map);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int payBooking(Map map) {	
		return overlapping.overlap_2(userbookingdao.payBooking(map));
	}
	
	@Override
	public List showBookingResult(Map map) {
		return userbookingdao.showBookingResult(map);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int updatepoint(Map map) {
		return overlapping.overlap_2(userbookingdao.updatepoint(map));
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int addpoint(Map map) {
		return overlapping.overlap_2(userbookingdao.addpoint(map));
	}
	
	@Override
	public int checkDate(Map map) {
		return userbookingdao.checkDate(map);
	}
	
	@Override
	public int checkVacancy(Map map) {	
		return userbookingdao.checkVacancy(map);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int hostCreatedPoint(Map map) {
		return userbookingdao.hostCreatedPoint(map);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int hostAddPoint(Map map) {
		return userbookingdao.hostAddPoint(map);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int subtractpoint(Map map) {
		return overlapping.overlap_2(userbookingdao.subtractpoint(map));
	}
	
	
	@Override
	public List currentBooking(Map map, HttpSession session) {	
		map.put("id", session.getAttribute("id"));			
		return userbookingdao.currentBooking(map);
	}
		
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int review_user(Map map) {	
		return overlapping.overlap_2(userbookingdao.review_user(map));
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int cancelBooking(Map map) {
		return overlapping.overlap_2(userbookingdao.cancelBooking(map));
	}

	@Override
	public List cancelBooking_select(Map map) {
		return userbookingdao.cancelBooking_select(map);
	}

	@Override
	public double getAverageScore(Map map) {
		return userbookingdao.getAvgerageScore(map);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int setCampsiteScore(Map map) {
		return userbookingdao.setCampsiteScore(map);
	}
	
	@Override
	public Map getBookInfo(Map map) {
		return userbookingdao.getBookInfo(map);
	}

	@Override
	public Map getInfoOfBookedRoom(Map map) {
		return userbookingdao.getInfoOfBookedRoom(map);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int refundUserPoint(Map map) {
		return userbookingdao.refundUserPoint(map);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int refundHostPoint(Map map) {
		return userbookingdao.refundHostPoint(map);
	}
}
