package com.hicamper.test.etc.evaluation.evaluation.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.etc.evaluation.evaluation.sql.EvaluationMapper;

@Repository
public class EvaluationDaoImp implements EvaluationDao {

	private static final Logger logger = LoggerFactory.getLogger(EvaluationDaoImp.class);
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public int thumbup(Map map) throws Exception {
		EvaluationMapper mapper	= sqlsession.getMapper(EvaluationMapper.class);
		return mapper.thumbup(map);
	}

	@Override
	public int thumbdown(Map map) throws Exception {
		EvaluationMapper mapper	= sqlsession.getMapper(EvaluationMapper.class);
		return mapper.thumbdown(map);
	}

	@Override
	public int starup(Map map) throws Exception {
		EvaluationMapper mapper	= sqlsession.getMapper(EvaluationMapper.class);
		return mapper.starup(map);
	}
	
	@Override
	public Map getPost(Map map) {
		EvaluationMapper mapper = sqlsession.getMapper(EvaluationMapper.class);
		return mapper.getPost(map);		
	}
}
