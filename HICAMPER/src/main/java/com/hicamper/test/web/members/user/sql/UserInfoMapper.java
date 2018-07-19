package com.hicamper.test.web.members.user.sql;

import java.util.List;
import java.util.Map;

public interface UserInfoMapper {
	
	public List showInfo(Map map);
	public int updateInfo(Map map);
	public int deleteInfo(Map map);

}
