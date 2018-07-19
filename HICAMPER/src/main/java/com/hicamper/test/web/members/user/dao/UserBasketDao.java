package com.hicamper.test.web.members.user.dao;

import java.util.List;
import java.util.Map;

public interface UserBasketDao {
	
	public List showBasket(Map map);
	
	public int addBasket(Map map);
	
	public int deleteBasket(Map map);
	
	public int checkBasket(Map map);
}
