package com.hicamper.test.etc.search.lookup.sql;

import java.util.List;
import java.util.Map;

public interface lookUpMapper {

	public List lookUpView(Map filterInfo);
	public int countList(Map filterInfo);
}
