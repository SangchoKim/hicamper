package com.hicamper.test.web.members.host.dao;

import java.util.List;
import java.util.Map;

public interface CampInfoDao {

	public List showRoom(Map map);
	public List showCamp(Map map);
	public int addCamp(Map map);
	public Map getHost_no(Map map);
	public int updateCamp(Map map);
	public int updateCampWithoutUpload(Map map);
	public int deleteCamp(Map map);
	public int getCampsite_no(Map map);
	public int hasCampsite(Map map);
}
