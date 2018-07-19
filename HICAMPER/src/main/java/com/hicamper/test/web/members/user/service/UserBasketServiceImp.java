package com.hicamper.test.web.members.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hicamper.test.web.members.user.dao.UserBasketDao;

@Service
@Transactional(readOnly = true)
public class UserBasketServiceImp implements UserBasketService {

	@Autowired
	UserBasketDao userbasketdao;
	
	@Override
	public List showBasket(Map map) {
		return userbasketdao.showBasket(map);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int addBasket(Map map) {
		return userbasketdao.addBasket(map);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int deleteBasket(Map map) {
		return userbasketdao.deleteBasket(map);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int checkBasket(Map map) {
		return userbasketdao.checkBasket(map);
	}
	
	
}
