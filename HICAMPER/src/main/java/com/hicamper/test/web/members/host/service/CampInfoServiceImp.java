package com.hicamper.test.web.members.host.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hicamper.test.web.members.host.Overlapping_host;
import com.hicamper.test.web.members.host.dao.CampInfoDao;

@Service
@Transactional(readOnly=true)
public class CampInfoServiceImp implements CampInfoService {

	private static final Logger logger = LoggerFactory.getLogger(CampInfoServiceImp.class);
	
	int result = 0;
	
	@Autowired
	private CampInfoDao campinfodao;
	
	
	@Autowired
	private Overlapping_host overlapping;
			
	@Override
	public List showRoom(Map map) {	
		return campinfodao.showRoom(map);
	}
	
	@Override
	public List showCamp(Map map) {		
		return campinfodao.showCamp(map);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int addCamp(HttpSession httpSession) throws Exception {
		
	try {
		Map map = new HashMap();
		
		map.put("campsite_name", httpSession.getAttribute("campsite_name_value"));
		map.put("phone_num", httpSession.getAttribute("phone_num_value"));
		map.put("campsite_group", httpSession.getAttribute("campsite_group_value"));
		map.put("address", httpSession.getAttribute("address_value"));
		map.put("comforts", httpSession.getAttribute("comforts_value"));
		map.put("activity", httpSession.getAttribute("activity_value"));
		map.put("explanation", httpSession.getAttribute("explanation_value"));
		map.put("attension", httpSession.getAttribute("attension_value"));
		map.put("host_no", httpSession.getAttribute("host_no"));
		map.put("fileupload_no", httpSession.getAttribute("fileupload_no"));
		result = campinfodao.addCamp(map);
		httpSession.setAttribute("campsite_no", map.get("campsite_no"));
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return overlapping.overlap_2(result);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int updateCamp(Map map) {
		result = campinfodao.updateCamp(map);			
		return overlapping.overlap_2(result);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int updateCampWithoutUpload(Map map) {
		return campinfodao.updateCampWithoutUpload(map);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int deleteCamp(Map map) {
		result = campinfodao.deleteCamp(map);
		return overlapping.overlap_2(result);
	}

	@Override
	public Map getHost_no(Map map) {
		return campinfodao.getHost_no(map);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int getCampsite_no(Map map) {
		return campinfodao.getCampsite_no(map);
	}
	
	@Override
	public int hasCampsite(Map map) {
		return campinfodao.hasCampsite(map);
	}



}
