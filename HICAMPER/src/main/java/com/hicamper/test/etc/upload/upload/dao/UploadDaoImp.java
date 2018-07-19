package com.hicamper.test.etc.upload.upload.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.etc.upload.upload.sql.UploadMapper;

@Repository
public class UploadDaoImp implements UploadDao {

	private static final Logger logger = LoggerFactory.getLogger(UploadDaoImp.class);
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public int uploadInsert(Map files) {
	UploadMapper mapper	= sqlsession.getMapper(UploadMapper.class);		
		return mapper.uploadInsert(files);
	}


}
