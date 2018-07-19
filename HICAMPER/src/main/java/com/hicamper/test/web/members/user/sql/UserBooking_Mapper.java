package com.hicamper.test.web.members.user.sql;

import java.util.List;
import java.util.Map;

public interface UserBooking_Mapper {
	public List showbookingpage(Map map);
	public List showUserReview(Map map);
	public List bookingInProgress(Map map);
	public List bookingInProgress_1(Map map);
	public int payBooking(Map map);
	public List showBookingResult(Map map);
	public int updatepoint(Map map);
	public int addpoint(Map map);
	public int checkDate(Map map);	
	public int checkVacancy(Map map);	
	public int hostCreatedPoint(Map map);
	public int hostAddPoint(Map map);
	public int subtractpoint(Map map);	
	public List  currentBooking(Map map);
	public int review_user(Map map);
	public int cancelBooking(Map map);
	public List cancelBooking_select(Map map);
	public double getAverageScore(Map map);
	public int setCampsiteScore(Map map);
	public Map getBookInfo(Map map);
	public Map getInfoOfBookedRoom(Map map);
	public int refundUserPoint(Map map);
	public int refundHostPoint(Map map);
}
