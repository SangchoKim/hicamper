package com.hicamper.test.web.members.host.dao;

import java.util.List;
import java.util.Map;

public interface HostInfoDao {

	public List showInfo(Map map);
	public int subtractPoint(Map map);
	public int addPoint(Map map);
	public int updateInfo(Map map);
	public int deleteInfo(Map map);
	//차후 mailing 추가
}