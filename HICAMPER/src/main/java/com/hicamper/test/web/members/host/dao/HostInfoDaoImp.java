package com.hicamper.test.web.members.host.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.web.members.host.sql.HostInfoMapper;


@Repository
public class HostInfoDaoImp implements HostInfoDao {

	private static final Logger logger = LoggerFactory.getLogger(HostInfoDaoImp.class);
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List showInfo(Map map) {
	HostInfoMapper hostinfomapper = sqlsession.getMapper(HostInfoMapper.class);
		return hostinfomapper.showInfo(map);
	}

	@Override
	public int subtractPoint(Map map) {
	HostInfoMapper hostinfomapper = sqlsession.getMapper(HostInfoMapper.class);
		return hostinfomapper.subtractPoint(map);
		
	}

	@Override
	public int addPoint(Map map) {
		HostInfoMapper hostinfomapper = sqlsession.getMapper(HostInfoMapper.class);
		return hostinfomapper.addPoint(map);
		
	}
	
	@Override
	public int updateInfo(Map map) {
		HostInfoMapper hostinfomapper = sqlsession.getMapper(HostInfoMapper.class);
		return hostinfomapper.updateInfo(map);
		
	}
	
	@Override
	public int deleteInfo(Map map) {
		HostInfoMapper hostinfomapper = sqlsession.getMapper(HostInfoMapper.class);
		return hostinfomapper.deleteInfo(map);
		
	}

}
