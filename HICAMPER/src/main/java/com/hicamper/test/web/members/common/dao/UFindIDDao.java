package com.hicamper.test.web.members.common.dao;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UFindIDDao{

	UFindIDDao ufindid;
	
	@Autowired
	private SqlSession sqlsession;
	

	public String userfind_id(String email) throws Exception{
		return sqlsession.selectOne("userfind_id", email);
	}

}
