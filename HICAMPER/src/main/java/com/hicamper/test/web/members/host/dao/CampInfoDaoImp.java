package com.hicamper.test.web.members.host.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.web.members.host.sql.CampInfoMapper;


@Repository
public class CampInfoDaoImp implements CampInfoDao {

	private static final Logger logger = LoggerFactory.getLogger(CampInfoDaoImp.class);
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List showRoom(Map map) {
		CampInfoMapper campinfomapper = sqlsession.getMapper(CampInfoMapper.class);	
		return campinfomapper.showRoom(map);
	}
	
	@Override
	public List showCamp(Map map) {
		CampInfoMapper campinfomapper = sqlsession.getMapper(CampInfoMapper.class);
		return campinfomapper.showCamp(map);
	}

	@Override
	public int addCamp(Map map) {
		CampInfoMapper campinfomapper = sqlsession.getMapper(CampInfoMapper.class);
		return campinfomapper.addCamp(map);
		
	}
	@Override
	public int updateCamp(Map map) {
		CampInfoMapper campinfomapper = sqlsession.getMapper(CampInfoMapper.class);
		return campinfomapper.updateCamp(map);
	}
	
	@Override
	public int updateCampWithoutUpload(Map map) {
		CampInfoMapper campinfomapper = sqlsession.getMapper(CampInfoMapper.class);
		return campinfomapper.updateCampWithoutUpload(map);
	}

	@Override
	public int deleteCamp(Map map) {
		CampInfoMapper campinfomapper = sqlsession.getMapper(CampInfoMapper.class);
		return campinfomapper.deleteCamp(map);
	}

	@Override
	public Map getHost_no(Map map) {
		CampInfoMapper campinfomapper = sqlsession.getMapper(CampInfoMapper.class);
		return campinfomapper.getHost_no(map);
	}
	
	@Override
	public int getCampsite_no(Map map) {
		CampInfoMapper campinfomapper = sqlsession.getMapper(CampInfoMapper.class);
		return campinfomapper.getCampsite_no(map);
	}
	
	@Override
	public int hasCampsite(Map map) {		
		CampInfoMapper campinfoMapper = sqlsession.getMapper(CampInfoMapper.class);
		return campinfoMapper.hasCampsite(map);
	}


}
