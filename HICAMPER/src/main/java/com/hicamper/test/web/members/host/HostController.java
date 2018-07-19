package com.hicamper.test.web.members.host;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.hicamper.test.web.members.host.service.CampInfoService;
import com.hicamper.test.web.members.host.service.Camp_productService;
import com.hicamper.test.web.members.host.service.HostBookingService;
import com.hicamper.test.web.members.host.service.HostInfoService;
/*import com.hicamper.test.web.members.host.service.UserBookingService;*/

@RequestMapping(value ="/host")
@Controller
public class HostController {
	
	private static final Logger logger = LoggerFactory.getLogger(HostController.class);
	
	/*@Autowired
	private UserBookingService userbooking;*/
	
	@Autowired
	private CampInfoService campinfo;

	@Autowired
	private HostInfoService hostinfo;
	
	@Autowired
	private Overlapping_host overlapping;
	
	@Autowired
	private Camp_productService camp_productservice;
	
	@Autowired
	private CampProductUpload upload;	
	
	@Autowired
	HostBookingService bookingService;
	
	@RequestMapping(value="/showcamp", method = {RequestMethod.GET,RequestMethod.POST })
	public String showcamp(Model model, @RequestParam Map map, HttpSession httpsession) throws Exception  {
		if (httpsession.getAttribute("host_no") == null) {
			return "redirect:/host/form_exception";
		}
		map.put("id", httpsession.getAttribute("id"));
		List<HashMap> list = campinfo.showCamp(map);
		List room = campinfo.showRoom(map);
		model.addAttribute("list", list);
		model.addAttribute("room", room);
		
		return "mypage/host/detailcamp";		
	}
	
	
	
	@RequestMapping(value="/addcamp", method = {RequestMethod.GET,RequestMethod.POST})
	public String addcamp(@RequestParam Map map, HttpSession session, Model model)  {
		if (session.getAttribute("host_no") == null) {
			return "redirect:/host/form_exception";
		}
		
		map.put("host_no", session.getAttribute("host_no"));		
		if (campinfo.hasCampsite(map) != 0) {			
			return overlapping.addcamp(model);
		};
		
		return "mypage/host/form1";
		
	}
	
	@RequestMapping(value="/addcamp_1", method={RequestMethod.GET,RequestMethod.POST })
	public String addcamp_1(Model model, @RequestParam Map map, HttpSession httpSession) throws Exception  {	
		map.put("id", httpSession.getAttribute("id"));
		Map getHost_no = campinfo.getHost_no(map);
		httpSession.setAttribute("host_no", getHost_no.get("host_no"));
		httpSession.setAttribute("campsite_name_value", map.get("campsite_name"));		
		return "mypage/host/form2";
		
	}
	
	@RequestMapping(value="/addcamp_2", method={RequestMethod.GET,RequestMethod.POST })
	public String addcamp_2(Model model, @RequestParam Map map, HttpSession httpSession) throws Exception  {		
		httpSession.setAttribute("phone_num_value", map.get("phone_num"));	
		return "mypage/host/form3";		
	}
	
	@RequestMapping(value="/addcamp_3", method={RequestMethod.GET,RequestMethod.POST })
	public String addcamp_3(Model model, @RequestParam Map map, HttpSession httpSession, HttpServletRequest req) throws Exception  {		
		String[] values = req.getParameterValues("campsite_group");	
		String str = String.join(",", values);		
		httpSession.setAttribute("campsite_group_value", str);
		return "mypage/host/form4";		
	}
	
	@RequestMapping(value="/addcamp_4", method={RequestMethod.GET,RequestMethod.POST })
	public String addcamp_4(Model model, @RequestParam Map map, HttpSession httpSession) throws Exception  {		
		httpSession.setAttribute("address_value", map.get("address"));
		return "mypage/host/form5";		
	}
	
	@RequestMapping(value="/addcamp_5", method={RequestMethod.GET,RequestMethod.POST })
	public String addcamp_5(Model model, @RequestParam Map map, HttpSession httpSession, HttpServletRequest req) throws Exception  {
		String[] values = req.getParameterValues("comforts");
		if(values == null) {
		String values2 = (String) httpSession.getAttribute("comforts_value");
		httpSession.setAttribute("comforts_value", values2);
		return "mypage/host/form6";
		}
		String str = String.join(",", values);
		httpSession.setAttribute("comforts_value", str);
		return "mypage/host/form6";		
	}
	
	@RequestMapping(value="/addcamp_6", method={RequestMethod.GET,RequestMethod.POST })
	public String addcamp_6(Model model, @RequestParam Map map, HttpSession httpSession, HttpServletRequest req) throws Exception  {		
		String[] values = req.getParameterValues("activity");
		if(values == null) {
		String values2 = (String) httpSession.getAttribute("activity_value");
		httpSession.setAttribute("activity_value", values2);
		return "mypage/host/form7";
		}
		String str = String.join(",", values);
		httpSession.setAttribute("activity_value", str);
		return "mypage/host/form7";		
	}
	
	@RequestMapping(value="/addcamp_7", method={RequestMethod.GET,RequestMethod.POST })
	public String addcamp_7(Model model, @RequestParam Map map, HttpSession httpSession) throws Exception  {		
		httpSession.setAttribute("explanation_value", map.get("explanation"));
		return "mypage/host/form8";		
	}
	
	@RequestMapping(value="/addcamp_8", method={RequestMethod.GET,RequestMethod.POST })
	public String addcamp_8(Model model, @RequestParam Map map, HttpSession httpSession) throws Exception  {			
		httpSession.setAttribute("attension_value", map.get("attension"));	
		return "mypage/host/form9";		
	}
	
	@RequestMapping(value="/addcamp_10", method={RequestMethod.GET,RequestMethod.POST })
	public String addcamp_10(Model model, @RequestParam Map map, HttpSession httpSession) throws Exception  {			
		int result = campinfo.addCamp(httpSession);
		if(result == 1) {
			return "mypage/host/form10";		
		}
		return "common/error/commonexception";
	}
	
	@RequestMapping(value="/roomform", method={RequestMethod.GET,RequestMethod.POST })
	public String roomform(HttpSession session, Model model, @RequestParam Map map) {				
		map.put("host_no", session.getAttribute("host_no"));
		
		if (campinfo.hasCampsite(map) == 0) {
			return overlapping.regProduct2(model);
		}
		
		return "mypage/host/roomform";	
	}

	@RequestMapping(value="/reg_product", method={RequestMethod.GET,RequestMethod.POST })
	public String reg_product(Model model, @RequestParam Map map, 
			@RequestParam("room_thumbnail") MultipartFile[] multipartfile,
			HttpServletRequest req, HttpSession httpSession) throws Exception {
		map.put("host_no", httpSession.getAttribute("host_no")) ;				
		int campsite_no = campinfo.getCampsite_no(map);
		map.put("campsite_no", campsite_no);
		
		map.put("upload", upload.Upload(multipartfile, req));
		
		int count = camp_productservice.addCamp_product(map);				
		return overlapping.reg_product(model, count);
			
	}
	
	@RequestMapping(value="/roomform2", method={RequestMethod.GET,RequestMethod.POST })
	public String roomform2() {	
		return "mypage/host/roomform2";
		
	}
	
	@RequestMapping(value="/room_auth", method={RequestMethod.GET,RequestMethod.POST })
	public String room_auth(@RequestParam Map map, Model model, HttpSession httpSession) throws Exception {	
		map.put("host_no", httpSession.getAttribute("host_no"));
		List list = camp_productservice.room_auth(map);
		if(list == null) {
			return "common/error/commonexception";
		}
		model.addAttribute("value", map.get("value"));
		model.addAttribute("list", list);
		return "mypage/host/auth_room";
		
	}
	
	@RequestMapping(value="/compare_pw", method={RequestMethod.GET,RequestMethod.POST })
	public String compare_pw(@RequestParam Map map, Model model) throws Exception {
		Integer count = camp_productservice.compare_pw(map);
		String value = (String) map.get("value");
		if (count == null) {
			return "common/error/compare_pw";
		} else if (value.equals("1")) {
			return "forward:/host/roomdelete";
		}
		return "forward:/host/roomdetail";
		
	}
	
	@RequestMapping(value="/roomdelete", method={RequestMethod.GET,RequestMethod.POST })
	public String roomdelete(@RequestParam Map map, Model model) {
		int count = camp_productservice.deleteCamp_product(map);
		return overlapping.roomdelete(model, count);
		
	}
	
	@RequestMapping(value="/roomdetail", method={RequestMethod.GET,RequestMethod.POST })
	public String roomdetail(@RequestParam Map map, Model model) {
		List<HashMap> list = campinfo.showCamp(map);
		List room = campinfo.showRoom(map);
		model.addAttribute("list", list);
		model.addAttribute("room", room);
		return "mypage/host/updateroom";
		
	}
	
	@RequestMapping(value="/roommodify", method={RequestMethod.GET,RequestMethod.POST })
	public String roommodify(@RequestParam Map map, Model model, @RequestParam("campsite_thumbnail") 
						MultipartFile[] multipartfile, HttpServletRequest req) throws Exception {
		
		
		
		String rootpath = req.getSession().getServletContext().getRealPath("/");
		String realfolder = "resources/campingroom/";
		File dir = new File(realfolder);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		Map files = new HashMap();
		
		String name = null;
		String filename = null;
		long filesize = 0;
		
		for(MultipartFile file : multipartfile) {
			
			
			name = file.getName();
			filename = file.getOriginalFilename();
			filesize = file.getSize();
			
			if(filesize == 0) {
				int count = camp_productservice.updateCamp_productWithoutUpload(map);
				return overlapping.roommodify(model, count);
			}
			
			String ext = filename.substring(filename.lastIndexOf('.'));
			String saveFileName = getUuid() + ext;		
		
			File serverfile = new File(rootpath + realfolder + saveFileName); 
			file.transferTo(serverfile);
		
			
			files.put("filename", filename);
			files.put("saveFileName", saveFileName);
			files.put("filesize", filesize );
		}
		
		map.put("files", files);
		int count = camp_productservice.updateCamp_product(map);
		return overlapping.roommodify(model, count);
		
	}
	
	public static String getUuid() {

		return UUID.randomUUID().toString().replaceAll("-", ""); 		
	}

	// camp update auth
	@RequestMapping(value = "/auth_upcamp", method = {RequestMethod.POST,RequestMethod.GET})
	public String auth_upcamp(Model model, @RequestParam Map map, HttpSession httpsession) {
		map.put("host_no", httpsession.getAttribute("host_no"));
		List<HashMap> list = hostinfo.showInfo(map);
		model.addAttribute("list", list);
		model.addAttribute("same_url", "/host/detailcamp?campsite_no=" + map.get("campsite_no"));
		model.addAttribute("diff_url", "/host/showcamp");
		return "mypage/host/auth_upcamp";	
	}
	
	// camp update form	
	@RequestMapping(value="/detailcamp", method={RequestMethod.POST,RequestMethod.GET})
	public String detailcamp(Model model, @RequestParam Map map, HttpSession httpsession) throws Exception {		
		map.put("id", httpsession.getAttribute("id"));
		List<HashMap> list = campinfo.showCamp(map);
		model.addAttribute("list", list);
		return "mypage/host/updatecamp";
	}
	
	// camp update 
	@RequestMapping(value="/updatecamp", method={RequestMethod.POST,RequestMethod.GET})
	public String updatecamp(@RequestParam Map map, Model model, @RequestParam("campsite_thumbnail") 
	MultipartFile[] multipartfile, HttpServletRequest req) throws Exception {
		
		String[] values = req.getParameterValues("activity");	
		String str = String.join(",", values);
		String[] values1 = req.getParameterValues("comforts");	
		String str1 = String.join(",", values1);
		String[] values2 = req.getParameterValues("campsite_group");	
		String str2 = String.join(",", values2);
		
		map.put("activity", str);
		map.put("comforts", str1);
		map.put("campsite_group", str2);

		
		String rootpath = req.getSession().getServletContext().getRealPath("/");
		String realfolder = "resources/fileupload/";
		File dir = new File(realfolder);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		Map files = new HashMap();
		
		String name = null;
		String filename = null;
		long filesize = 0;
		
		for(MultipartFile file : multipartfile) {
			
			
			name = file.getName();
			filename = file.getOriginalFilename();
			filesize = file.getSize();
			
			if(filesize == 0) {
				int result = campinfo.updateCampWithoutUpload(map);
				return overlapping.updatecamp(model, result);
			}
			
			String ext = filename.substring(filename.lastIndexOf('.'));
			String saveFileName = getUuid() + ext;		
		
			File serverfile = new File(rootpath + realfolder + saveFileName); 
			file.transferTo(serverfile);
		
			
			files.put("filename", filename);
			files.put("saveFileName", saveFileName);
			files.put("filesize", filesize );
		}
		map.put("files", files);
		int result = campinfo.updateCamp(map);			
		return overlapping.updatecamp(model, result);
					
	}
	
	// camp delete auth
		@RequestMapping(value = "/auth_decamp", method = {RequestMethod.POST,RequestMethod.GET})
		public String auth_decamp(Model model, HttpServletRequest req, @RequestParam Map map, HttpSession httpsession) {
			map.put("host_no", httpsession.getAttribute("host_no"));
			List<HashMap> list = hostinfo.showInfo(map);
			model.addAttribute("list", list);
			model.addAttribute("same_url", "/host/deletecamp?campsite_no=" + map.get("campsite_no"));
			model.addAttribute("diff_url", "/host/showcamp");
			return "mypage/host/auth_decamp";	
		}
	
	// camp delete 
	@RequestMapping(value="/deletecamp", method={RequestMethod.POST,RequestMethod.GET})
	public String deletecamp(Model model, @RequestParam Map map) throws Exception {
		int result = campinfo.deleteCamp(map);		
		return overlapping.deletecamp(model, result);
		
	}

	// show hostinfo
	@RequestMapping(value="/showinfo", method = {RequestMethod.GET,RequestMethod.POST })
	public String showinfo(Model model, @RequestParam Map map, HttpSession httpsession) throws Exception  {		
		if (httpsession.getAttribute("host_no") == null)
			return "redirect:/";
				
		map.put("host_no", httpsession.getAttribute("host_no"));
		List<HashMap> list = hostinfo.showInfo(map);
		model.addAttribute("list", list);
		return "mypage/host/hostinfo";
		
	}
	

	@RequestMapping(value="/subtractpoint", method=RequestMethod.GET)
	public String subtractpoint(Model model, @RequestParam Map map) throws Exception {
		
		int result = hostinfo.subtractPoint(map);		
		return overlapping.overlap_host_1(model, result);
		
	}

	@RequestMapping(value="/addpoint", method=RequestMethod.GET)
	public String addpoint(Model model, @RequestParam Map map) throws Exception {
		
		int result = hostinfo.addPoint(map);		
		return overlapping.overlap_host_1(model, result);
		
	}
	
	// host update auth
	@RequestMapping(value = "/auth_up", method = {RequestMethod.POST,RequestMethod.GET})
	public String auth_up(Model model, HttpServletRequest req, @RequestParam("authpw") String pw, @RequestParam Map map, HttpSession session) {
		map.put("host_no", session.getAttribute("host_no"));		
		List<HashMap> list = hostinfo.showInfo(map);
		model.addAttribute("list", list);
		model.addAttribute("authpw", pw);
		model.addAttribute("same_url", "/host/upinfo");
		model.addAttribute("diff_url", "/host/showinfo");
		return "mypage/host/auth_up";	
	}
	
	// host update form
	@RequestMapping(value = "/upinfo", method = RequestMethod.GET)
	public String upinfo(Model model, HttpServletRequest req, @RequestParam Map map, HttpSession session) {
		int host_no = (int) session.getAttribute("host_no");
		map.put("host_no", host_no);
		List<HashMap> list = hostinfo.showInfo(map);
		model.addAttribute("list", list);
		return "mypage/host/upinfo";	
	}
	
	// host update
	@RequestMapping(value="/updateinfo", method = {RequestMethod.POST,RequestMethod.GET})
	public String updateinfo(Model model, @RequestParam Map map, HttpSession session) throws Exception {
		map.put("host_no", session.getAttribute("host_no"));
		int result = hostinfo.updateInfo(map);
		return overlapping.overlap_host_1(model, result);		
	}
	
	// host delete auth
	@RequestMapping(value = "/auth_de", method = {RequestMethod.POST,RequestMethod.GET})
	public String auth_de(Model model, HttpServletRequest req, @RequestParam("authpw") String pw, @RequestParam Map map,HttpSession session) {
		map.put("host_no", session.getAttribute("host_no"));
		List<HashMap> list = hostinfo.showInfo(map);
		model.addAttribute("list", list);
		model.addAttribute("authpw", pw);
		model.addAttribute("same_url", "/host/deinfo");
		model.addAttribute("diff_url", "/host/showinfo");
		return "mypage/host/auth_de";	
	}
	
	// host delete form
	@RequestMapping(value = "/deinfo", method = RequestMethod.GET)
	public String deinfo(Model model, HttpServletRequest req, @RequestParam Map map, HttpSession session) {
		map.put("host_no", session.getAttribute("host_no"));
		List<HashMap> list = hostinfo.showInfo(map);
		model.addAttribute("list", list);
		return "mypage/host/deinfo";	
	}
	
	// host delete
	@RequestMapping(value="/deleteinfo", method = {RequestMethod.POST,RequestMethod.GET})
	public String deleteinfo(Model model, @RequestParam Map map, HttpSession session) throws Exception {
		map.put("host_no", session.getAttribute("host_no"));
		int result = hostinfo.deleteInfo(map);
		session.invalidate();
		return overlapping.overlap_host_2(model, result);
		
	}
	
	@RequestMapping(value="/currentbooking_host", method = {RequestMethod.GET,RequestMethod.POST })
	public String currentBooking(Model model, @RequestParam Map map, HttpSession session) throws Exception  {
		map.put("host_no", session.getAttribute("host_no"));
		List<HashMap> list0 = bookingService.showHostBooking(map);
		List<HashMap> list2 = bookingService.showUserInfoFromUser(map);
		if(list0 == null && list2 == null || list0.isEmpty() && list2.isEmpty()) {
			return "common/error/currentbooking";
		}
		model.addAttribute("list0", list0);
		model.addAttribute("list2", list2);	
		return "mypage/host/host_currentbooking";
		
	}
	
	@RequestMapping(value="/currentbookingdetail_host", method = {RequestMethod.GET,RequestMethod.POST }, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String currentBookingDetail(Model model, @RequestParam Map map ) throws Exception  {	
		List<Map<String, Object>> list = bookingService.showUserDetails(map);
		
		int user_no = 0;
		String id = null;
		String name = null;
		String phone_num = null;
		String email = null;
		String birth = null;
		String gender = null;
				
		for(Map<String, Object> map1: list) {
			user_no = (int) map1.get("user_no");
			id = (String) map1.get("id");
			name = (String) map1.get("name");
			phone_num = (String) map1.get("phone_num");
			email = (String) map1.get("email");
			birth = (String) map1.get("birth");
			gender = (String) map1.get("gender");
		}
		JsonObject json = new JsonObject();
		json.addProperty("user_no", user_no);
		json.addProperty("id", id);
		json.addProperty("name", name);
		json.addProperty("phone_num", phone_num);
		json.addProperty("email", email);
		json.addProperty("birth", birth);
		json.addProperty("gender", gender);
				
		return new Gson().toJson(json);
		
	}
	
	@RequestMapping(value="/form_exception", method = {RequestMethod.GET,RequestMethod.POST})
	public String formException(HttpSession session)  {
		
		return "/mypage/host/form_exception";			
	}
	
}