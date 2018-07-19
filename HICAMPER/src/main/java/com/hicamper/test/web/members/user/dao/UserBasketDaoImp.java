package com.hicamper.test.web.members.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.web.members.user.sql.UserBasketMapper;

@Repository
public class UserBasketDaoImp implements UserBasketDao {

	private static final Logger logger = LoggerFactory.getLogger(UserBasketDaoImp.class);
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List showBasket(Map map) {	
		UserBasketMapper mapper = sqlsession.getMapper(UserBasketMapper.class);
		return mapper.showBasket(map);	
	}

	@Override
	public int addBasket(Map map) {
		UserBasketMapper mapper = sqlsession.getMapper(UserBasketMapper.class);
		return mapper.addBasket(map);
	}

	@Override
	public int deleteBasket(Map map) {
		UserBasketMapper mapper = sqlsession.getMapper(UserBasketMapper.class);
		return mapper.deleteBasket(map);
	}
	
	@Override
	public int checkBasket(Map map) {
		UserBasketMapper mapper = sqlsession.getMapper(UserBasketMapper.class);
		return mapper.checkBasket(map);
	}
	
}
