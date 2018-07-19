package com.hicamper.test.web.members.host.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hicamper.test.web.members.host.Overlapping_host;
import com.hicamper.test.web.members.host.dao.Camp_productDao;

@Service
@Transactional(readOnly=true)
public class Camp_productServiceImp implements Camp_productService {

	private static final Logger logger = LoggerFactory.getLogger(Camp_productServiceImp.class);
	
	@Autowired
	Camp_productDao camp_productDao;
	
	@Autowired
	private Overlapping_host overlapping;
	
	@Override
	public List showCamp_product(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int addCamp_product(Map map) throws Exception {
		int count = camp_productDao.addCamp_product(map);
		return overlapping.overlap_2(count);
	}

	@Override
	public List room_auth(Map map) throws Exception {	
		return camp_productDao.room_auth(map);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public Integer compare_pw(Map map) throws Exception {
		return camp_productDao.compare_pw(map);
	}
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int updateCamp_product(Map map) {
		return camp_productDao.updateCamp_product(map);
	}
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int updateCamp_productWithoutUpload(Map map) throws Exception {
		return camp_productDao.updateCamp_productWithoutUpload(map);
	}
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int deleteCamp_product(Map map) {
		return camp_productDao.deleteCamp_product(map);
	}





}
