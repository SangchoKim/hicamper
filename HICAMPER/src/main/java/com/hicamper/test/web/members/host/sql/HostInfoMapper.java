package com.hicamper.test.web.members.host.sql;

import java.util.List;
import java.util.Map;

public interface HostInfoMapper {

	public List showInfo(Map map);
	public int subtractPoint(Map map);
	public int addPoint(Map map);
	public int updateInfo(Map map);
	public int deleteInfo(Map map);	
}