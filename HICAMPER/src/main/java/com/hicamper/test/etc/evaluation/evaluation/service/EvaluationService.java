package com.hicamper.test.etc.evaluation.evaluation.service;

import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface EvaluationService {
	
	public int thumbup(Map map) throws Exception;
	public int thumbdown(Map map) throws Exception;
	public int starup(Map map) throws Exception;
	public Map getPost(Map map);
}
