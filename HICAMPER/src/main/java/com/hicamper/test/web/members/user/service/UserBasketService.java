package com.hicamper.test.web.members.user.service;

import java.util.List;
import java.util.Map;

public interface UserBasketService {
	
	public List showBasket(Map map);
	
	public int addBasket(Map map);
	
	public int deleteBasket(Map map);
	
	public int checkBasket(Map map);
}
