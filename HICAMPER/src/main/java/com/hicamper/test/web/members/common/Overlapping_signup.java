package com.hicamper.test.web.members.common;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

@Repository
public class Overlapping_signup {

	public String Interceptor(Model model) {
		model.addAttribute("forward","common/login");
		model.addAttribute("method_name","Interceptor");
		return "mypage/common/alert";
	}
		
	public int overlap_2(int count) {
		
		if (count == 1) {
			
		} else {
			
		}		
		return count;		
	}
}
