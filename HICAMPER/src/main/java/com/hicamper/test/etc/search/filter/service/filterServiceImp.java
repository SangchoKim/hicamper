package com.hicamper.test.etc.search.filter.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hicamper.test.etc.search.filter.dao.filterDao;
import com.hicamper.test.etc.search.filter.service.filterService;

@Service
public class filterServiceImp implements filterService {

	private static final Logger logger = LoggerFactory.getLogger(filterServiceImp.class);
	
	@Autowired
	private filterDao filterdao;
	
	@Override
	public int countList(Map filterInfo) {	
		return filterdao.countList(filterInfo);
	}

	@Override
	public List filterCheck(Map filterInfo) {	
		return filterdao.filterCheck(filterInfo);
	}

	@Override
	public List showList(Map filterInfo) {	
		return filterdao.filterCheck(filterInfo);
	}
}
