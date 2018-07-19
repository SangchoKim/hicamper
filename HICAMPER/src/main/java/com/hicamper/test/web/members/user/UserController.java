package com.hicamper.test.web.members.user;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hicamper.test.web.members.common.CommonExceptionHandler;
import com.hicamper.test.web.members.user.service.UserBasketService;
import com.hicamper.test.web.members.user.service.UserBooking_Service;
import com.hicamper.test.web.members.user.service.UserInfoService;

@RequestMapping(value = "/user")
@Controller
public class UserController {	

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserBooking_Service userbookingservice;	

	@Autowired
	private UserInfoService userinfo;	
	
	@Autowired
	private Overlapping_user overlapping;
	
	@Autowired
	private UserBasketService userbasketservice;
	
	@RequestMapping(value = "/showbookingpage", method = {RequestMethod.GET,RequestMethod.POST} )
	public String showbookingpage(Model model, @RequestParam Map map, HttpSession httpSession) {
		httpSession.setAttribute("campsite_no", map.get("campsite_no"));
		List list = userbookingservice.showbookingpage(map);
		List list1 = userbookingservice.showUserReview(map);
		model.addAttribute("list", list);
		model.addAttribute("review", list1);
		return "etc/showdetail";		
	}
	
	@RequestMapping(value = "/bookinginprogress_1", method = {RequestMethod.GET,RequestMethod.POST} )
	public String bookingInProgress_1(Model model, @RequestParam Map map, HttpSession httpSession)  {
		if (httpSession.getAttribute("user_no") == null) {
			model.addAttribute("YES", "no");
			model.addAttribute("forward", "/user/showbookingpage?campsite_no=" + map.get("campsite_no"));
			model.addAttribute("method_name", "bookingprogress_1");
			
			return "mypage/common/alert";
		}
			
			
		map.put("user_no", httpSession.getAttribute("user_no"));
		Map mapPlus = overlapping.GapOfCheckInAndCheckOut(map);
		httpSession.setAttribute("calDataDays", mapPlus);
		List list = userbookingservice.bookingInProgress(map);
		List list1 = userbookingservice.bookingInProgress_1(map);
		model.addAttribute("cam_list", list);
		model.addAttribute("user_list", list1);
		return "mypage/user/showpay";		
	}
	
	@RequestMapping(value = "/bookinginprogress_2", method = {RequestMethod.GET,RequestMethod.POST} )
	public String bookinginprogress_2(Model model, @RequestParam Map map, HttpSession httpSession) {
		map.put("id", httpSession.getAttribute("id"));
		int amountofDate = userbookingservice.checkDate(map);
		int vacancy = userbookingservice.checkVacancy(map);
		
		if (amountofDate < vacancy) {
			int result = userbookingservice.subtractpoint(map);
			int result1 = userbookingservice.hostAddPoint(map);
			
			if (result1 != 1) {
				int value = userbookingservice.hostCreatedPoint(map);
			}
		
			int count = userbookingservice.payBooking(map);
		
			if (count == 1) {
				httpSession.setAttribute("book_no", map.get("book_no"));
				return "redirect:/user/bookinginprogress_3";
			}
		
			return new CommonExceptionHandler().handleException();
		
		} else {
			int finaly = 1;
			model.addAttribute("campsite_no", httpSession.getAttribute("campsite_no"));
			return overlapping.bookinginprogress_2(finaly, model);
		}
		
	}
	
	@RequestMapping(value = "/bookinginprogress_3", method = {RequestMethod.GET,RequestMethod.POST} )
	public String bookinginprogress_3(Model model, @RequestParam Map map, HttpSession httpSession) {
		map.put("id", httpSession.getAttribute("id"));
		map.put("book_no", httpSession.getAttribute("book_no"));
		
		List list = userbookingservice.showBookingResult(map);
		model.addAttribute("list", list);
		return"mypage/user/payresult";
	}
	
	@RequestMapping(value = "/pointform", method = {RequestMethod.GET,RequestMethod.POST} )
	public String pointform() {
		return"mypage/user/pointform";
	}
	
	@RequestMapping(value = "/pointform1", method = {RequestMethod.GET,RequestMethod.POST} )
	public String pointform1() {
		return"mypage/user/pointform1";
	}
	
	@RequestMapping(value = "/updatepoint", method = {RequestMethod.GET,RequestMethod.POST} )
	public String updatepoint(Model model,@RequestParam Map map, HttpSession httpSession, HttpServletRequest req) {
		map.put("user_no", httpSession.getAttribute("user_no"));
		int count = userbookingservice.updatepoint(map);
		String value = req.getParameter("value");
		if(value.equals("1")) {
			if(count == 1) {
				return overlapping.addpoint1(count, model, map);
			}else {
				return "forward:/user/addpoint";
			}
		}else if(value.equals("2")) {
			if(count == 1) {
				return overlapping.addpoint(count, model, map, httpSession);				
			}else {
				
				return "forward:/user/addpoint";
			}
			
		}
		return "common/error/error-500";
	}
	
	@RequestMapping(value = "/addpoint", method = {RequestMethod.GET,RequestMethod.POST} )
	public String addpoint(Model model,@RequestParam Map map, HttpSession httpSession, HttpServletRequest req) {
		map.put("user_no", httpSession.getAttribute("user_no"));
		int count = userbookingservice.addpoint(map);
		String value = req.getParameter("value");
		
		if(value.equals("1")) {
			if(count == 1) {
				return overlapping.addpoint1(count, model, map);
			}else {
				return "common/error/error-500";
			}
		}else if(value.equals("2")) {
			if(count == 1) {
				return overlapping.addpoint(count, model, map, httpSession);				
			}else {
				
				return "common/error/error-500";
			}
			
		}
		return "common/error/error-500";
	}

	
	@RequestMapping(value = "/currentbooking_user", method = {RequestMethod.GET,RequestMethod.POST} )
	public String currentBooking(@RequestParam Map map, Model model, HttpSession session) {		
		List list = userbookingservice.currentBooking(map,session);	
		
		if (list == null || list.isEmpty()) { 
			return "common/error/currentbooking";
		} else { 		
			model.addAttribute("list1", overlapping.dateCompare1(list, model));
			model.addAttribute("list2", overlapping.dateCompare2(list, model));
		}
		
		return "mypage/user/currentbooking";
	}
			
	@RequestMapping(value = "/review_form", method = {RequestMethod.GET,RequestMethod.POST} )
	public String review_form(Model model, @RequestParam Map map, HttpSession httpSession) {
		httpSession.setAttribute("campsite_no", map.get("campsite_no"));
		return "mypage/user/reviewform";
		
	}
	
	@RequestMapping(value = "/review_user", method = {RequestMethod.GET,RequestMethod.POST} )
	public String review_user(Model model, @RequestParam Map map, HttpSession httpSession) {		
		map.put("campsite_no", httpSession.getAttribute("campsite_no"));
		map.put("user_id", httpSession.getAttribute("id"));
		map.put("user_no", httpSession.getAttribute("user_no"));
		
		int count = userbookingservice.review_user(map);
		
		double avgScore = userbookingservice.getAverageScore(map);		
		map.put("avgScore", avgScore);
		
		int ret = userbookingservice.setCampsiteScore(map);
		
		return overlapping.review_user(count, model);
		
	}
			
	@RequestMapping(value = "/cancelbooking_user", method = {RequestMethod.GET,RequestMethod.POST})
	public String deleteBooking(Model model, @RequestParam Map map) {
		Map bookInfo;
		bookInfo = userbookingservice.getBookInfo(map);
		
		map.put("user_no", bookInfo.get("user_no"));
		map.put("dates_of_stay", bookInfo.get("dates_of_stay"));
		
		Map InfoOfBookedRoom;
		InfoOfBookedRoom = userbookingservice.getInfoOfBookedRoom(bookInfo);
		
		map.put("price", InfoOfBookedRoom.get("price"));
		map.put("host_no", InfoOfBookedRoom.get("host_no"));
		
		int ret;
		ret = userbookingservice.refundUserPoint(map);
		ret = userbookingservice.refundHostPoint(map);
		System.out.println(map);
		
		
		int result = userbookingservice.cancelBooking(map);
		return overlapping.cancelBooking(model, result, map);
		
	}
	
	@RequestMapping(value = "/cancelBooking_select", method = {RequestMethod.GET,RequestMethod.POST} )
	public String deleteBooking_select(Model model, @RequestParam Map map, HttpSession session) {
		List list = userbookingservice.currentBooking(map, session);
		if (list == null) { 
			return "common/error/currentbooking";
		}else { 		
			model.addAttribute("list1", overlapping.dateCompare1(list, model));
			model.addAttribute("list2", overlapping.dateCompare2(list, model));
		}			
		return "mypage/user/currentbooking";
		
	}
		
	@RequestMapping(value="/showbasket", method = {RequestMethod.GET,RequestMethod.POST })
	public String showBasket(Model model, HttpSession session, @RequestParam Map map) throws Exception  {
		int user_no = (int) session.getAttribute("user_no");
		map.put("user_no", user_no);
		List list = userbasketservice.showBasket(map);
		model.addAttribute("list", list);
		return "mypage/user/showbasket";	
	}
	
	@RequestMapping(value="/addbasket", method = {RequestMethod.GET,RequestMethod.POST })
	@ResponseBody
	public int addBasket(Model model, HttpSession session, @RequestParam Map map) throws Exception  {
		int user_no;
		
		if (session.getAttribute("user_no") == null) {
			return -2; 
		} else {
			user_no = (int) session.getAttribute("user_no");
		}		
		
		map.put("user_no", user_no);
		
		int result = -1; 
		
		result = userbasketservice.checkBasket(map);		
		if (result != 0) {
			return 0; 
		}			
		
		result = userbasketservice.addBasket(map);
		return result;
	}	
	
	@RequestMapping(value="/deletebasket", method = {RequestMethod.GET,RequestMethod.POST })
	public String deleteBasket(Model model, @RequestParam Map map) throws Exception  {
		int result = userbasketservice.deleteBasket(map);
		return "mypage/user/deletebasket";	
	}
	
	// show userinfo
		@RequestMapping(value="/showinfo", method = {RequestMethod.GET,RequestMethod.POST })
		public String showinfo(Model model, @RequestParam Map map, HttpSession httpsession) throws Exception  {		
			if (httpsession.getAttribute("user_no") == null)
				return "redirect:/";
			
			map.put("user_no", httpsession.getAttribute("user_no"));
			List<HashMap> list = userinfo.showInfo(map);
			model.addAttribute("list", list);
			return "mypage/user/userinfo";
			
		}
	
	//user update auth
	@RequestMapping(value = "/auth_up", method = {RequestMethod.POST,RequestMethod.GET})
	public String auth_up(HttpSession httpsession, Model model, HttpServletRequest req, @RequestParam("authpw") String pw, @RequestParam Map map) {
		map.put("user_no", httpsession.getAttribute("user_no"));
		List<HashMap> list = userinfo.showInfo(map);		
		model.addAttribute("list", list);
		model.addAttribute("authpw", pw);
		model.addAttribute("same_url", "/user/updateform");
		model.addAttribute("diff_url", "/user/showinfo");
		return "mypage/user/auth_up";
	}
	
	//go user update form
	@RequestMapping(value="/updateform", method = {RequestMethod.POST,RequestMethod.GET} )
		public String updateform(HttpSession httpsession, Model model, HttpServletRequest req, @RequestParam Map map) {
			map.put("user_no", httpsession.getAttribute("user_no"));
			List<HashMap> list = userinfo.showInfo(map);
			model.addAttribute("list", list);
			return "mypage/user/updateform";
	}
	
	// user update
	@RequestMapping(value="/updateinfo", method = {RequestMethod.POST,RequestMethod.GET})
	public String updateinfo(HttpSession httpsession, Model model, @RequestParam Map map) throws Exception {
		map.put("user_no", httpsession.getAttribute("user_no"));
		int result = userinfo.updateInfo(map);
		return "redirect: /user/showinfo";
		
	}
		
	// user delete auth
	@RequestMapping(value = "/auth_de", method = {RequestMethod.POST,RequestMethod.GET})
	public String auth_de(HttpSession httpsession, Model model, HttpServletRequest req, @RequestParam("authpw") String pw, @RequestParam Map map) {
		map.put("user_no", httpsession.getAttribute("user_no"));
		List<HashMap> list = userinfo.showInfo(map);
		model.addAttribute("list", list);
		model.addAttribute("authpw", pw);
		model.addAttribute("same_url", "/user/deleteform");
		model.addAttribute("diff_url", "/user/showinfo");
		return "mypage/user/auth_de";	
	}
		
	// go user delete form
	@RequestMapping(value = "/deleteform", method = RequestMethod.GET)
	public String deleteform(HttpSession httpsession, Model model, HttpServletRequest req, @RequestParam Map map) {
		map.put("user_no", httpsession.getAttribute("user_no"));
		List<HashMap> list = userinfo.showInfo(map);
		model.addAttribute("list", list);
		return "mypage/user/deleteform";	
	}
		
	// user delete
	@RequestMapping(value="/deleteinfo", method = {RequestMethod.POST,RequestMethod.GET})
	public String deleteinfo(HttpSession httpsession, Model model, @RequestParam Map map) throws Exception {
		map.put("user_no", httpsession.getAttribute("user_no"));
		int result = userinfo.deleteInfo(map);
		httpsession.invalidate();
		return "home";
		
	}
		
}
