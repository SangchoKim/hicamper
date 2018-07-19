package com.hicamper.test.etc.search.lookup.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.etc.search.filter.sql.filterMapper;
import com.hicamper.test.etc.search.lookup.sql.lookUpMapper;

@Repository
public class lookUpDaoImp implements lookUpDao {

	private static final Logger logger = LoggerFactory.getLogger(lookUpDaoImp.class);
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List lookUpView(Map filterInfo) {
	lookUpMapper mapper = sqlsession.getMapper(lookUpMapper.class);
		return mapper.lookUpView(filterInfo);
	}

	@Override
	public int countList(Map filterInfo) {
		lookUpMapper mapper = sqlsession.getMapper(lookUpMapper.class);
		return mapper.countList(filterInfo);
	}

}
