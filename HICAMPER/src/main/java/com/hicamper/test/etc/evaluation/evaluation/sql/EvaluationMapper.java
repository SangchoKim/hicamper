package com.hicamper.test.etc.evaluation.evaluation.sql;

import java.util.Map;

public interface EvaluationMapper {

	public int thumbup(Map map) throws Exception;
	public int thumbdown(Map map) throws Exception;
	public int starup(Map map) throws Exception;
	public Map getPost(Map map);
	
}
