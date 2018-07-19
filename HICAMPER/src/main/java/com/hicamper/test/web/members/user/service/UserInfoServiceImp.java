package com.hicamper.test.web.members.user.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hicamper.test.web.members.user.Overlapping_user;
import com.hicamper.test.web.members.user.dao.UserInfoDao;

@Service
@Transactional(readOnly=true)
public class UserInfoServiceImp implements UserInfoService{
	
	private static final Logger logger = LoggerFactory.getLogger(UserInfoServiceImp.class);
	
	int result = 0;
	
	@Autowired
	private UserInfoDao userinfodao;
	
	@Autowired
	private Overlapping_user overlapping;
	
	@Override
	public List showInfo(Map map) {
		return userinfodao.showInfo(map);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int updateInfo(Map map) {
		result = userinfodao.updateInfo(map);			
		return overlapping.overlap_2(result);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int deleteInfo(Map map) {
		result = userinfodao.deleteInfo(map);		
		return overlapping.overlap_2(result);
	}

}
