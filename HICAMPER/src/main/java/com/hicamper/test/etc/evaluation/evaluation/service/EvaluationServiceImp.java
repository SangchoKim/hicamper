package com.hicamper.test.etc.evaluation.evaluation.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hicamper.test.etc.evaluation.evaluation.Overlapping_Evaluation;
import com.hicamper.test.etc.evaluation.evaluation.dao.EvaluationDao;

@Transactional(readOnly = true)
@Service
public class EvaluationServiceImp implements EvaluationService {
	
	private static final Logger logger = LoggerFactory.getLogger(EvaluationServiceImp.class);
	
	@Autowired
	Overlapping_Evaluation overlapping;

	@Autowired
	EvaluationDao dao;
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int thumbup(Map map) throws Exception {
		return overlapping.overlap_2(dao.thumbup(map));
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int thumbdown(Map map) throws Exception {
		return overlapping.overlap_2(dao.thumbdown(map));
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int starup(Map map) throws Exception {
		return overlapping.overlap_2(dao.starup(map));
	}
	
	@Override
	public Map getPost(Map map) {
		return dao.getPost(map);
	}

}
