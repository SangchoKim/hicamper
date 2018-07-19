package com.hicamper.test.etc.search.lookup.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hicamper.test.etc.search.lookup.Overlapping_Lookup;
import com.hicamper.test.etc.search.lookup.dao.lookUpDao;

@Service
public class lookUpServiceImp implements lookUpService {

	private static final Logger logger = LoggerFactory.getLogger(lookUpServiceImp.class);
	
	@Autowired
	private Overlapping_Lookup overlapping;
	
	@Autowired
	private lookUpDao lookupdao;
	
	@Override
	public List lookUpView(Map map) {
		return lookupdao.lookUpView(map);			
	}
	
	@Override
	public int countList(Map map) {	
		return lookupdao.countList(map);
	}
}
