package com.hicamper.test.web.members.common.login.sql;

import java.util.List;
import java.util.Map;

public interface SearchPwMapper {
	
	public List checkHostID(Map map);
	
	public int changeHostPW(Map map);
	
	public List checkUserID(Map map);
	
	public int changeUserPW(Map map);
}
