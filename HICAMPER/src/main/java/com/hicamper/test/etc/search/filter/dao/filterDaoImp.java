package com.hicamper.test.etc.search.filter.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.etc.search.filter.dao.filterDaoImp;
import com.hicamper.test.etc.search.filter.sql.filterMapper;

@Repository
public class filterDaoImp implements filterDao {
	
private static final Logger logger = LoggerFactory.getLogger(filterDaoImp.class);
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public int countList(Map map) {
		filterMapper filtermapper = sqlsession.getMapper(filterMapper.class);
		return filtermapper.countList(map);
	}

	@Override
	public List filterCheck(Map map) {
	filterMapper filtermapper = sqlsession.getMapper(filterMapper.class);
		return filtermapper.filterCheck(map);
	}

	@Override
	public List showList(Map map) {
		filterMapper filtermapper = sqlsession.getMapper(filterMapper.class);
		return filtermapper.filterCheck(map);
	}

}
