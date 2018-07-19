package com.hicamper.test.web.members.host.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface CampInfoService {

	public List showRoom(Map map);
	public List showCamp(Map map);
	@Transactional
	public int addCamp(HttpSession httpSession) throws Exception;
	public Map getHost_no(Map map);
	public int updateCamp(Map map);
	public int updateCampWithoutUpload(Map map);
	public int deleteCamp(Map map);
	public int getCampsite_no(Map map);
	public int hasCampsite(Map map);
	
}
