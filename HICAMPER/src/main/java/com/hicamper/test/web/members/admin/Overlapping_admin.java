package com.hicamper.test.web.members.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

@Transactional(readOnly = true)
@Repository
public class Overlapping_admin {
	
	public String overlap_dehost(Model model, int result) {
			
		String forward = "mypage/common/alert";
				
			if (result == 1) {
				model.addAttribute("YES", "yes");
				model.addAttribute("method_name", "admin_dehost");
				model.addAttribute("forward", "/admin/hostlist");
			} else {
				model.addAttribute("NO", "no");
				model.addAttribute("method_name", "admin_dehost");
				model.addAttribute("forward", "/admin/hostlist");
			}		
				
			return forward;	
	}
	
	public String overlap_deuser(Model model, int result) {
		
		String forward = "mypage/common/alert";
		
		if (result == 1) {
			model.addAttribute("YES", "yes");
			model.addAttribute("method_name", "admin_deuser");
			model.addAttribute("forward", "/admin/userlist");
		} else {
			model.addAttribute("NO", "no");
			model.addAttribute("method_name", "admin_deuser");
			model.addAttribute("forward", "/admin/userlist");
		}
		
		return forward;		
	}
	
}