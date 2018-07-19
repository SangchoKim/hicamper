package com.hicamper.test.web.members.user.dao;

import java.util.List;
import java.util.Map;

public interface UserInfoDao {
	
	public List showInfo(Map map);
	public int updateInfo(Map map);
	public int deleteInfo(Map map);
	
}
