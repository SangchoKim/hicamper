package com.hicamper.test.etc.search.filter.sql;

import java.util.List;
import java.util.Map;

public interface filterMapper {
	
	public int countList(Map map);

	public List filterCheck(Map map);
	
	public List showList(Map map);

}
