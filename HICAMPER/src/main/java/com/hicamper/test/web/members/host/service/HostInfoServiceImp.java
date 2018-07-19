package com.hicamper.test.web.members.host.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hicamper.test.web.members.host.Overlapping_host;
import com.hicamper.test.web.members.host.dao.HostInfoDao;

@Service
@Transactional(readOnly=true)
public class HostInfoServiceImp implements HostInfoService {

	private static final Logger logger = LoggerFactory.getLogger(HostInfoServiceImp.class);
	
	int result = 0;
	
	@Autowired
	private HostInfoDao hostinfodao;
	
	@Autowired
	private Overlapping_host overlapping;
			
	@Override
	public List showInfo(Map map) {		
		return hostinfodao.showInfo(map);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int subtractPoint(Map map) {
		result = hostinfodao.updateInfo(map);			
		return overlapping.overlap_2(result);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int addPoint(Map map) {
		result = hostinfodao.updateInfo(map);			
		return overlapping.overlap_2(result);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int updateInfo(Map map) {
		result = hostinfodao.updateInfo(map);			
		return overlapping.overlap_2(result);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int deleteInfo(Map map) {
		result = hostinfodao.deleteInfo(map);		
		return overlapping.overlap_2(result);
	}

}