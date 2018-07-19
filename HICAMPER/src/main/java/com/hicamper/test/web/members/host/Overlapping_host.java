package com.hicamper.test.web.members.host;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.hicamper.test.web.members.host.service.CampInfoService;
import com.hicamper.test.web.members.host.service.HostInfoService;

@Transactional(readOnly = true)
@Repository
public class Overlapping_host<praivte> {
	
	@Autowired
	private CampInfoService campinfo;

	@Autowired
	private HostInfoService hostinfo;	

	public String overlap_1(Model model , int result) {
		
		String forward = "mypage/common/alert";
		
		if (result == 1) {
			model.addAttribute("YES", "yes");
		} else {
			model.addAttribute("NO", "no");
		}		
		model.addAttribute("forward", "/host/showcamp");
		
		return forward;
	}

	public int overlap_2(int result) {
		
		if(result == 1) {
			System.out.println("Success");
		}else{
			System.out.println("Fail");
		}			
		return result;		
	}
		
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public String overlap_3(Model model , int result) {		
		String forward = "mypage/common/alert";
	 		
		if (result == 0) {
			model.addAttribute("NO", "no");
			model.addAttribute("forward", "/");		
			return forward;
		}
		
		return null;
	}
	
	public Map overlap_4(Map map) {		
		map.put("col", "campsite_name");
		map.put("value", map.get("campsite_name"));	
		return map;
	}

	public String overlap_host_1( Model model , int result) {
		if (result == 1) {
			model.addAttribute("YES", "yes");
		} else {
			model.addAttribute("NO", "no");
		}
		
		String forward = "mypage/common/alert";
		model.addAttribute("forward", "/host/showinfo");
		model.addAttribute("method_name", "updateinfo");
		
		return forward;
	}
	
	public String overlap_host_2( Model model , int result) {
		if (result == 1) {
			model.addAttribute("YES", "yes");
		} else {
			model.addAttribute("NO", "no");
		}
		
		String forward = "mypage/common/alert";
		model.addAttribute("forward", "/");
		model.addAttribute("method_name", "deleteinfo");
		return forward;
	}
	
	public String reg_product( Model model , int result) {
		
		String forward = "mypage/common/alert";
			
			if (result == 1) {
				model.addAttribute("YES", "yes");
				model.addAttribute("method_name", "reg_product");
				model.addAttribute("forward", "roomform2");
			} else {
				model.addAttribute("NO", "no");
				model.addAttribute("forward", "roomform");
			}		
			
			return forward;
		}
	
	public String roomdelete( Model model , int result) {
		
		String forward = "mypage/common/alert";
			
			if (result == 1) {
				model.addAttribute("YES", "yes");
				model.addAttribute("method_name", "roomdelete");
				model.addAttribute("forward", "showcamp");
			} else {
				model.addAttribute("NO", "no");
				model.addAttribute("method_name", "roomdelete");
				model.addAttribute("forward", "showcamp");
			}		
			
			return forward;
		}

	public String roommodify( Model model , int result) {
	
		String forward = "mypage/common/alert";
		
		if (result == 1) {
			model.addAttribute("YES", "yes");
			model.addAttribute("method_name", "roommodify");
			model.addAttribute("forward", "showcamp");
		} else {
			model.addAttribute("NO", "no");
			model.addAttribute("method_name", "roommodify");
			model.addAttribute("forward", "showcamp");
		}		
		
		return forward;
	}
	
	public String updatecamp(Model model , int result) {
		
		String forward = "mypage/common/alert";
			
		if (result == 1 || result == 2) {
			model.addAttribute("YES", "yes");
			model.addAttribute("method_name", "updatecamp");
		} else {
			model.addAttribute("NO", "no");
		}	
		
		model.addAttribute("forward", "/host/showcamp");
			
		return forward;
	}
	
	public String deletecamp(Model model , int result) {		
		String forward = "mypage/common/alert";
			
		if (result == 1) {
			model.addAttribute("YES", "yes");
			model.addAttribute("method_name", "deletecamp");
		} else {
			model.addAttribute("NO", "no");
		}		
		model.addAttribute("forward", "/host/showcamp");
			
		return forward;
	}
	
	public String addcamp(Model model) {		
		String forward = "mypage/common/alert";
		
		model.addAttribute("YES", "no");
		model.addAttribute("method_name", "addcamp");
		model.addAttribute("forward", "/host/showcamp");
		
		return forward;
	}
	
	public String regProduct2(Model model) {		
		String forward = "mypage/common/alert";
		
		model.addAttribute("YES", "no");
		model.addAttribute("method_name", "regProduct2");
		model.addAttribute("forward", "/host/showcamp");
		
		return forward;
	}
}
