package com.hicamper.test.web.members.user;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
public class Overlapping_user {

	String forward = "mypage/common/alert";

	public String cancelBooking(Model model, int result, Map map) {

		if (result == 1) {
			model.addAttribute("YES", "yes");
		} else {
			model.addAttribute("NO", "no");
		}
		model.addAttribute("book_no", map.get("book_no"));
		model.addAttribute("forward", "cancelBooking_select?book_no=" + map.get("book_no"));
		model.addAttribute("method_name", "cancelBooking");

		return forward;
	}

	public int overlap_2(int result) {

		if (result == 1) {
			System.out.println("Success");
		} else {
			System.out.println("Fail");
		}
		return result;
	}

	public String formattedDate() {

		Date date = new Date();
		String strDateFormat = "hh:mm:ss a";
		DateFormat dateformat = new SimpleDateFormat(strDateFormat);
		String formattedDate = dateformat.format(date);
		return formattedDate;

	}

	public List dateCompare1(List<Map<String, Object>> list, Model model) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date = dateFormat.format(new Date());
		List list1 = new ArrayList();
		String forward = null;

		for (Map<String, Object> map : list) {

			String checkOut = (String) map.get("check_out");
			int compare = date.compareTo(checkOut);
			if (compare <= 0) {
				list1.add(map);
			}
		}

		return list1;
	}

	public List dateCompare2(List<Map<String, Object>> list, Model model) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date = dateFormat.format(new Date());
		List list1 = new ArrayList();
		String forward = null;

		for (Map<String, Object> map : list) {

			String checkOut = (String) map.get("check_out");
			int compare = date.compareTo(checkOut);
			if (compare > 0) {
				list1.add(map);
			}
		}
		return list1;

	}

	public String overlap_user_1(Model model, int result) {

		String forward = "mypage/common/alert";

		if (result == 1) {
			model.addAttribute("YES", "yes");
		} else {
			model.addAttribute("NO", "no");
		}
		model.addAttribute("forward", "/user/showinfo");

		return forward;
	}

	public Map GapOfCheckInAndCheckOut(Map map) {

		String checkin = (String) map.get("checkin");
		String checkout = (String) map.get("checkout");

		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

			Date FirstData = format.parse(checkin);
			Date SecondData = format.parse(checkout);

			long CalData = FirstData.getTime() - SecondData.getTime();

			long calDataDays = CalData / (24 * 60 * 60 * 1000);

			calDataDays = Math.abs(calDataDays);
			map.put("calDataDays", calDataDays);
			map.put("checkin", checkin);
			map.put("checkout", checkout);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return map;

	}

	public String addpoint(int result, Model model, Map map, HttpSession httpSession) {

		if (result == 1) {
			model.addAttribute("YES", "yes");
		} else {
			model.addAttribute("NO", "no");
		}

		model.addAttribute("forward", "showbookingpage?campsite_no=" + httpSession.getAttribute("campsite_no"));
		model.addAttribute("method_name", "addpoint");
		model.addAttribute("point_no", map.get("point_no"));
		return forward;
	}
	
	public String addpoint1(int result, Model model, Map map) {

		if (result == 1) {
			model.addAttribute("YES", "yes");
		} else {
			model.addAttribute("NO", "no");
		}

		model.addAttribute("forward", "showinfo");
		model.addAttribute("method_name", "addpoint1");
		return forward;
	}

	public String review_user(int result, Model model) {

		if (result == 1) {
			model.addAttribute("YES", "yes");
		} else {
			model.addAttribute("NO", "no");
		}

		model.addAttribute("forward", "currentbooking_user");
		model.addAttribute("method_name", "review_user");
		return forward;
	}

	public String bookinginprogress_2(int result, Model model) {

		if (result == 1) {
			model.addAttribute("YES", "yes");
		} else {
			model.addAttribute("NO", "no");
		}

		model.addAttribute("forward", "showbookingpage?campsite_no=");
		model.addAttribute("method_name", "bookinginprogress_2");
		return forward;
	}

}
