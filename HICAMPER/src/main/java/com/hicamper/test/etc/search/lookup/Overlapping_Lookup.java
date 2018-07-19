package com.hicamper.test.etc.search.lookup;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;


@Component
public class Overlapping_Lookup {
		
		Map map = new HashMap();
		private int total;
		private	int result;
		private int value;
		
	public List lookUpView(List list) {
		total = 0;
 		for( int i = 0; i < list.size(); i++) {
		map = (Map) list.get(i);
		value = (int)map.get("score");
		total += value ;
		}		
		result = total/list.size();
		Map map1 = new HashMap();
		map1.put("score", result);
		List list1 = new ArrayList();
		list1.add(map1);		
		return list1;
		
	}
	
	public List lookUpError(List list) {	
		System.out.println(list);		
		return list;
		
	}

}
