package com.hicamper.test.web.members.host.dao;

import java.util.List;
import java.util.Map;

public interface Camp_productDao {

	public List showCamp_product(Map map);
	public int addCamp_product(Map map);
	public List room_auth(Map map) ;
	public Integer compare_pw(Map map);
	public int updateCamp_product(Map map);
	public int updateCamp_productWithoutUpload(Map map); 
	public int deleteCamp_product(Map map);
}
