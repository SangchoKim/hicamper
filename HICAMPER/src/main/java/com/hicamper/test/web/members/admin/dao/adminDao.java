package com.hicamper.test.web.members.admin.dao;

import java.util.List;
import java.util.Map;

public interface adminDao {
	
	public List HostList(Map map);
	public int countHostList(Map map);
	public int ad_deleteHost(Map map);
	
	public List UserList(Map map);
	public int countUserList(Map map);
	public int ad_deleteUser(Map map);

	public List BookingList(Map map);
	public int countBookingList(Map map);
	public int countBooking(Map map);
	public int countcancelBooking(Map map);
		
	public List boardList(Map map);
	public int countBoardList(Map map);
		
	public int deleteBoard(Map map);
}
