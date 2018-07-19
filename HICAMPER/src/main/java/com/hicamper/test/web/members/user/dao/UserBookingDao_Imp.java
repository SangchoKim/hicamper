package com.hicamper.test.web.members.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.web.members.user.sql.UserBooking_Mapper;

@Repository
public class UserBookingDao_Imp implements UserBooking_Dao {

	private static final Logger logger = LoggerFactory.getLogger(UserBookingDao_Imp.class);
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List showbookingpage(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.showbookingpage(map);
	}
	
	@Override
	public List showUserReview(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.showUserReview(map);
	}
		
	@Override
	public List bookingInProgress(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);	
		return mapper.bookingInProgress(map);
	}
	
	@Override
	public List bookingInProgress_1(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);	
		return mapper.bookingInProgress_1(map);
	}
	
	@Override
	public int payBooking(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.payBooking(map);
	}
	
	@Override
	public List showBookingResult(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.showBookingResult(map);
	}
	
	@Override
	public int updatepoint(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.updatepoint(map);
	}
	
	@Override
	public int addpoint(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.addpoint(map);
	}
	
	@Override
	public int checkDate(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.checkDate(map);
	}
	
	@Override
	public int checkVacancy(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.checkVacancy(map);
	}
	
	@Override
	public int hostCreatedPoint(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.hostCreatedPoint(map);
	}
	
	@Override
	public int hostAddPoint(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.hostAddPoint(map);
	}
	
	@Override
	public int subtractpoint(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.subtractpoint(map);
	}
	
	
	@Override
	public List  currentBooking(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.currentBooking(map);
	}
	
	@Override
	public int review_user(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.review_user(map);
	}
	
	@Override
	public int cancelBooking(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.cancelBooking(map);
	}

	@Override
	public List cancelBooking_select(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.cancelBooking_select(map);
	}

	@Override
	public double getAvgerageScore(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.getAverageScore(map);
	}

	@Override
	public int setCampsiteScore(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.setCampsiteScore(map);
	}

	@Override
	public Map getBookInfo(Map map) {		
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.getBookInfo(map);
	}

	@Override
	public Map getInfoOfBookedRoom(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.getInfoOfBookedRoom(map);
	}
	
	@Override
	public int refundUserPoint(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.refundUserPoint(map);
	}
	
	@Override
	public int refundHostPoint(Map map) {
		UserBooking_Mapper mapper = sqlsession.getMapper(UserBooking_Mapper.class);
		return mapper.refundHostPoint(map);
	}
	
}
