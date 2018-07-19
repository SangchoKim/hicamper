package com.hicamper.test.etc.search.lookup.dao;

import java.util.List;
import java.util.Map;

public interface lookUpDao {

	public List lookUpView(Map filterInfo);
	public int countList(Map filterInfo);
	
}
