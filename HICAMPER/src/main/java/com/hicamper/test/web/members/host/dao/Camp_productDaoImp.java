package com.hicamper.test.web.members.host.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.web.members.host.sql.Camp_productMapper;

@Repository
public class Camp_productDaoImp implements Camp_productDao {
	
	private static final Logger logger = LoggerFactory.getLogger(Camp_productDaoImp.class);
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List showCamp_product(Map map) {
		Camp_productMapper mapper = sqlsession.getMapper(Camp_productMapper.class);
		return mapper.showCamp_product(map);
	}

	@Override
	public int addCamp_product(Map map) {
		Camp_productMapper mapper = sqlsession.getMapper(Camp_productMapper.class);
		return mapper.addCamp_product(map);
	}

	@Override
	public List room_auth(Map map) {
		Camp_productMapper mapper = sqlsession.getMapper(Camp_productMapper.class);
		return mapper.room_auth(map);
	}
	
	@Override
	public Integer compare_pw(Map map) {
		Camp_productMapper mapper = sqlsession.getMapper(Camp_productMapper.class);
		return mapper.compare_pw(map);
	}
	
	@Override
	public int updateCamp_product(Map map) {
		Camp_productMapper mapper = sqlsession.getMapper(Camp_productMapper.class);
		return mapper.updateCamp_product(map);
	}

	@Override
	public int deleteCamp_product(Map map) {
		Camp_productMapper mapper = sqlsession.getMapper(Camp_productMapper.class);
		return mapper.deleteCamp_product(map);
	}

	@Override
	public int updateCamp_productWithoutUpload(Map map) {
		Camp_productMapper mapper = sqlsession.getMapper(Camp_productMapper.class);
		return mapper.updateCamp_productWithoutUpload(map);
	}



	

}
