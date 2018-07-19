package com.hicamper.test.web.members.common.login.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hicamper.test.web.members.common.login.dao.SearchPwDao;


@Service
@Transactional(readOnly=true)
public class SearchPwServiceImp implements SearchPwService {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchPwServiceImp.class);
	
	@Autowired
	private SearchPwDao searchpwdao;
	
	public List checkHostID(Map map) {
		return searchpwdao.checkHostID(map);
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int changeHostPW(Map map) {
		return searchpwdao.changeHostPW(map);
	}
	
	public List checkUserID(Map map) {
		return searchpwdao.checkUserID(map);
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int changeUserPW(Map map) {
		return searchpwdao.changeUserPW(map);
	}
}
