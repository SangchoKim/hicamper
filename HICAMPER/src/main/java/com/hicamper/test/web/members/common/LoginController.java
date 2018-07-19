package com.hicamper.test.web.members.common;

import java.util.HashMap;

import java.util.List;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hicamper.test.web.members.common.dao.HFindIDDto;
import com.hicamper.test.web.members.common.service.HFindIDService;
import com.hicamper.test.web.members.common.service.UFindIDService;
import com.hicamper.test.web.members.common.login.service.LoginService;
import com.hicamper.test.web.members.common.login.service.SearchPwService;
import com.hicamper.test.web.members.common.signup.service.SignUpService;


@RequestMapping(value = "/common")
@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private SignUpService signupservice;

	@Autowired

	private HFindIDService hfindidservice;
	
	@Autowired
	private UFindIDService ufindidservice;	
	
	@Autowired
	private LoginService loginservice;
	
	@Autowired
	private SearchPwService searchpwservice;
	
	@Autowired
	private Overlapping_signup overlapping;
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String Signup() {		
		return "common/signup";
		
	}
	
	@RequestMapping(value="/interceptor", method={RequestMethod.POST, RequestMethod.GET})
	public String interceptor() {		
		return "common/error/intercep";
		
	}
		
	@RequestMapping(value="/login", method={RequestMethod.POST, RequestMethod.GET})
	public String login(@RequestParam Map map, HttpServletRequest req) {
		Map logincheck_host = loginservice.hostLoginID(map);
		Map logincheck_user = loginservice.userLoginID(map);
		
		if (logincheck_host.get("host_no") != null || logincheck_user.get("user_no") != null) {
			String referer = req.getHeader("referer");
			return "redirect:" + referer;
		}
		
		return "common/loginform";
	}
	
	@RequestMapping(value="/loginid", method= {RequestMethod.POST, RequestMethod.GET})
	public String hostloginid(Model model, HttpServletRequest request, HttpSession session, @RequestParam Map map) {
		Map logincheck_host = loginservice.hostLoginID(map);
		Map logincheck_user = loginservice.userLoginID(map);
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		if (logincheck_host.get("host_no") == null && logincheck_user.get("user_no") == null) {
			return "redirect:/common/login?ret=0";
		} else if (logincheck_host.get("host_no") != null) {
			session.setAttribute("id", id);			
			session.setAttribute("host_no", logincheck_host.get("host_no"));
						 
			return "redirect:/" ; 
		} else {
			session.setAttribute("id", id);			
			session.setAttribute("user_no", logincheck_user.get("user_no"));			
			
			return "redirect:/";
		}
	}

	@RequestMapping(value="/logout", method= {RequestMethod.POST, RequestMethod.GET})
	public String logout(HttpSession httpSession, @RequestParam Map map, HttpServletRequest req) {
		httpSession.invalidate();		
		
		return "redirect:/";
	}	
	
	@RequestMapping(value="/hostsignupform", method=RequestMethod.GET)
	public String hostSignupForm() {		
		return "common/host/hostsignupform";		
	}
	
	@RequestMapping(value="/hostsignup",  method= {RequestMethod.POST, RequestMethod.GET})
	public String hostSignup(Model model, @RequestParam Map map) throws Exception {	;
		int count = signupservice.hostSignUp(map);
		
		if(count==1) {
			String forward = "common/host/hostsignup_view";			
			
			return forward;
		}else {
			String error = "common/error/commonexception";

			return error;
		}
					
	}
	
	@RequestMapping(value="/usersignupform", method=RequestMethod.GET)
	public String userSignupForm() {		
		return "common/user/usersignupform";		
	}
	
	@RequestMapping(value="/usersignup", method=RequestMethod.POST)
	public String userSignup(Model model, @RequestParam Map map) throws Exception {	
		String birth = (String) map.get("birthyear");
		birth += "-" + (String) map.get("birthmonth");
		birth += "-" + (String) map.get("birthdate");
		map.put("birth", birth);
		
		int count = signupservice.userSignUp(map);
		
		if(count == 1) {
			String forward = "common/user/usersignup_view";			
			
			return forward;
		}else {
			String error = "common/error/commonexception";

			return error;
		}
					
	}
	
	@RequestMapping(value="/hostcheckid", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String check(Model model, @RequestParam Map map) {
		Integer result = signupservice.hostCheckID(map);
		return String.valueOf(result);
		
	}
	
	@RequestMapping(value="/usercheckid", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String usercheckid(Model model, @RequestParam Map map) {
		Integer result = signupservice.hostCheckID(map);
		return String.valueOf(result);
		
	}	

	@RequestMapping(value="/checkid", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String checkid(Model model, @RequestParam Map map) {
		Integer result = signupservice.hostCheckID(map);
		result += signupservice.userCheckID(map);
		
		return String.valueOf(result);		
	}
	
	
	@RequestMapping(value="/hostfind_id_form")
	public String host_find_id_form() throws Exception{
		return "mypage/host/find_id_form";
	}
	
	@RequestMapping(value="/hfound_id")
	public String hostFindIDForm(HttpServletResponse resp, @RequestParam("email") String email, Model model) throws Exception {
		model.addAttribute("id", hfindidservice.hostfind_id(resp, email));
		return "mypage/host/found_id";
	}
	
	
	@RequestMapping(value="/userfind_id_form")
	public String user_find_id_form() throws Exception{
		return "mypage/user/find_id_form";
	}
	
	@RequestMapping(value="/ufound_id")
	public String userFindIDForm(HttpServletResponse resp, @RequestParam("email") String email, Model model) throws Exception {
		model.addAttribute("id", ufindidservice.userfind_id(resp, email));
		return "mypage/user/found_id";
	}
	
	@RequestMapping(value="/search_pw", method=RequestMethod.GET)
	public String SearchPw() {
		return "common/search_pw";	
	}
	
	@RequestMapping(value="/hsearch_pw", method=RequestMethod.GET)
	public String hostSearchPw() {
		return "common/host/hsearch_pw";	
	}
	
	@RequestMapping(value="/auth_host", method = {RequestMethod.GET,RequestMethod.POST})
	public String auth_Host(Model model, @RequestParam Map map, @RequestParam("email") String auth_mail) {	
		
		Random rnd =new Random();
		StringBuffer pw =new StringBuffer();
		for(int i=0;i<8;i++){
		    if(rnd.nextBoolean()){
		        pw.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        pw.append((rnd.nextInt(10))); 
		    }
		}		
		model.addAttribute("pw", pw);
		List<HashMap> list = searchpwservice.checkHostID(map);
		model.addAttribute("list", list);
		model.addAttribute("auth_mail", auth_mail); 
		model.addAttribute("diff_url", "/common/hsearch_pw");
		return "common/host/auth_host";
		
	}
	
	@RequestMapping(value="/change_hpw", method = {RequestMethod.GET,RequestMethod.POST})
	public String changeHostPW(Model model, @RequestParam Map map) {
		
		int result = searchpwservice.changeHostPW(map);
		model.addAttribute("result", result);
		List<HashMap> list = searchpwservice.checkHostID(map);
		model.addAttribute("list", list);
		model.addAttribute("diff_url", "/common/hsearch_pw");
		return "common/host/change_hpw";	
		
	}
	
	@RequestMapping(value="/usearch_pw", method=RequestMethod.GET)
	public String userSearchPw() {
		return "common/user/usearch_pw";	
	} 
	
	@RequestMapping(value="/auth_user", method = {RequestMethod.GET,RequestMethod.POST})
	public String auth_User(Model model, @RequestParam Map map, @RequestParam("email") String auth_mail) {

		Random rnd =new Random();
		StringBuffer pw =new StringBuffer();
		for(int i=0;i<8;i++){
		    if(rnd.nextBoolean()){
		        pw.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        pw.append((rnd.nextInt(10))); 
		    }
		}		
		model.addAttribute("pw", pw);
		List<HashMap> list = searchpwservice.checkUserID(map);
		model.addAttribute("list", list);
		model.addAttribute("auth_mail", auth_mail);
		model.addAttribute("diff_url", "/common/usearch_pw");
		return "common/user/auth_user";
		
	}
	
	@RequestMapping(value="/change_upw", method = {RequestMethod.GET,RequestMethod.POST})
	public String changeUserPW(Model model, @RequestParam Map map) {
		
		int result = searchpwservice.changeUserPW(map);
		model.addAttribute("result", result);
		List<HashMap> list = searchpwservice.checkUserID(map);
		model.addAttribute("list", list);
		model.addAttribute("diff_url", "/common/usearch_pw");
		return "common/user/change_upw";
		
	}

	@RequestMapping(value="/search_id", method=RequestMethod.GET)
	public String searchID() {
		return "common/search_id";	
	}

}
