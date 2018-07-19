package com.hicamper.test.web.members.user.sql;

import java.util.List;
import java.util.Map;

public interface UserBasketMapper {
	
	public List showBasket(Map map);
	
	public int addBasket(Map map);
	
	public int deleteBasket(Map map);
	
	public int checkBasket(Map map);
	
}
