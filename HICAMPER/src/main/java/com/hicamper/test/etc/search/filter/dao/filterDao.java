package com.hicamper.test.etc.search.filter.dao;

import java.util.List;
import java.util.Map;

public interface filterDao {
	
	public int countList(Map map);

	public List filterCheck(Map map);

	public List showList(Map map);

}
