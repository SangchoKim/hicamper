package com.hicamper.test.web.members.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hicamper.test.etc.search.filter.Criteria;
import com.hicamper.test.etc.search.filter.PageMaker;
import com.hicamper.test.web.members.admin.service.adminService;



@RequestMapping(value = "/admin")
@Controller
public class AdminController {
	
	@Autowired
	private adminService adminservice;
	
	@Autowired
	private Overlapping_admin overlapping;

	@RequestMapping(value="/hostlist", method={RequestMethod.POST, RequestMethod.GET})
	public String HostList(Model model, HttpServletRequest request, @RequestParam Map filterInfo)  {
		
		int currentPage = 1;
		int perPageNum = 10;
		int method = 1;
		
		if(request.getParameter("pages") != null) {
			currentPage = Integer.parseInt(request.getParameter("pages").toString());
		}

		filterInfo.put("currentPage", currentPage);
		filterInfo.put("perPageNum", perPageNum);		
		Map map = admin_Criteria.cri(filterInfo);
		int totalCount = adminservice.countHostList(map);
		
		map.put("totalCount", totalCount);
		Map paging = admin_PageMaker.calcData(filterInfo);
		
		int startPage = Integer.parseInt(paging.get("startPage").toString());
		int endPage = Integer.parseInt(paging.get("endPage").toString());
		int prevPage = Integer.parseInt(paging.get("prevPage").toString());
		int nextPage = Integer.parseInt(paging.get("nextPage").toString());
		boolean next = (boolean) paging.get("next");
		
		Map pageMap = new HashMap();
		pageMap.put("currentPage", currentPage);
		pageMap.put("perPageNum", perPageNum);
		pageMap.put("startPage", startPage);
		pageMap.put("endPage", endPage);
		pageMap.put("prevPage", prevPage);
		pageMap.put("nextPage", nextPage);
		pageMap.put("next", next);
		pageMap.put("method", method);
		model.addAttribute("pageMap", pageMap);	
		
		List<HashMap> list = adminservice.HostList(map);
		model.addAttribute("list", list);
		model.addAttribute("count", totalCount);
		return "admin/hostlist";	
	}
	@RequestMapping(value="/ad_deleteHost", method={RequestMethod.POST, RequestMethod.GET})
	public String ad_deleteHost(Model model, @RequestParam Map map, HttpSession session)  {
		int result = adminservice.ad_deleteHost(map);
		return overlapping.overlap_dehost(model, result);
	}
	
	
	@RequestMapping(value="/userlist", method={RequestMethod.POST, RequestMethod.GET})
	public String UserList(Model model, HttpServletRequest request, @RequestParam Map filterInfo)  {
		
		int currentPage = 1;
		int perPageNum = 10;
		int method = 1;
		
		if(request.getParameter("pages") != null) {
			currentPage = Integer.parseInt(request.getParameter("pages").toString());
		}

		filterInfo.put("currentPage", currentPage);
		filterInfo.put("perPageNum", perPageNum);		
		Map map = admin_Criteria.cri(filterInfo);
		int totalCount = adminservice.countUserList(map);
		
		map.put("totalCount", totalCount);
		Map paging = admin_PageMaker.calcData(filterInfo);
		
		int startPage = Integer.parseInt(paging.get("startPage").toString());
		int endPage = Integer.parseInt(paging.get("endPage").toString());
		int prevPage = Integer.parseInt(paging.get("prevPage").toString());
		int nextPage = Integer.parseInt(paging.get("nextPage").toString());
		boolean next = (boolean) paging.get("next");
		
		Map pageMap = new HashMap();
		pageMap.put("currentPage", currentPage);
		pageMap.put("perPageNum", perPageNum);
		pageMap.put("startPage", startPage);
		pageMap.put("endPage", endPage);
		pageMap.put("prevPage", prevPage);
		pageMap.put("nextPage", nextPage);
		pageMap.put("next", next);
		pageMap.put("method", method);
		model.addAttribute("pageMap", pageMap);	
		
		List<HashMap> list = adminservice.UserList(map);
		model.addAttribute("list", list);
		model.addAttribute("count", totalCount);
		return "admin/userlist";	
	}	
	@RequestMapping(value="/ad_deleteUser", method={RequestMethod.POST, RequestMethod.GET})
	public String ad_deleteUser(Model model, @RequestParam Map map, HttpSession session)  {
		int result = adminservice.ad_deleteUser(map);
		return overlapping.overlap_deuser(model, result);
	}

	@RequestMapping(value="/boardlist", method={RequestMethod.POST, RequestMethod.GET})
	public String BoardList(Model model, HttpServletRequest request, @RequestParam Map filterInfo)  {
		
		int currentPage = 1;
		int perPageNum = 10;
		int board_group = 1;
		
		if(request.getParameter("pages") != null) {
			currentPage = Integer.parseInt(request.getParameter("pages").toString());
		}

		if(request.getParameter("board_group") != null) {
			board_group = Integer.parseInt(request.getParameter("board_group").toString());
		}
		
		filterInfo.put("currentPage", currentPage);
		filterInfo.put("perPageNum", perPageNum);		
		filterInfo.put("board_group", board_group);		
		Map map = admin_Criteria.cri(filterInfo);
		int totalCount = adminservice.countBoardList(map);
		
		map.put("totalCount", totalCount);
		Map paging = admin_PageMaker.calcData(filterInfo);
		
		int startPage = Integer.parseInt(paging.get("startPage").toString());
		int endPage = Integer.parseInt(paging.get("endPage").toString());
		int prevPage = Integer.parseInt(paging.get("prevPage").toString());
		int nextPage = Integer.parseInt(paging.get("nextPage").toString());
		boolean next = (boolean) paging.get("next");
		
		Map pageMap = new HashMap();
		pageMap.put("currentPage", currentPage);
		pageMap.put("perPageNum", perPageNum);
		pageMap.put("startPage", startPage);
		pageMap.put("endPage", endPage);
		pageMap.put("prevPage", prevPage);
		pageMap.put("nextPage", nextPage);
		pageMap.put("next", next);
		pageMap.put("board_group", board_group);
		model.addAttribute("pageMap", pageMap);	
		
		List<HashMap> list = adminservice.boardList(map);
		model.addAttribute("list", list);
		model.addAttribute("count", totalCount);
		
		String boardName = getBoardName(map);
		model.addAttribute("boardName", boardName);
		
		return "admin/boardlist";	
	}

	@RequestMapping(value="/deleteboard", method={RequestMethod.POST, RequestMethod.GET})
	public String DeleteBoard(Model model, HttpServletRequest request, @RequestParam Map map)  {
		
		int idx = Integer.parseInt(request.getParameter("idx").toString());
		int board_group = Integer.parseInt(request.getParameter("board_group").toString());
		int pages = Integer.parseInt(request.getParameter("pages").toString());
		
		map.put("idx", idx);		
		map.put("board_group", board_group);		
		
		System.out.println(map);
		int list = adminservice.deleteBoard(map);
		
		return "forward:/admin/boardlist";	
	}
	
	public String getBoardName(Map map) {
		int boardGroupNumber = Integer.parseInt(map.get("board_group").toString());
		String boardGroupString;
		
		if (boardGroupNumber == 1) {
			boardGroupString = "질문 게시판";
		} else if (boardGroupNumber == 2) {
			boardGroupString = "캠핑후기 게시판";
		} else if (boardGroupNumber == 3) {
			boardGroupString = "캠핑팁 게시판";
		} else if (boardGroupNumber == 5) {
			boardGroupString = "FAQ";
		} else if (boardGroupNumber == 6) {
			boardGroupString = "공지사항";
		} else if (boardGroupNumber == 7) {
			boardGroupString = "1:1 문의";
		} else {
			boardGroupString = "알 수 없는 게시판";
		}
		
		return boardGroupString;
	}
	
	
	@RequestMapping(value="/bookinglist", method={RequestMethod.POST, RequestMethod.GET})
	public String BookingList(Model model, HttpServletRequest request, @RequestParam Map filterInfo)  {
	
		int currentPage = 1;
		int perPageNum = 10;
		int method = 1;
		
		if(request.getParameter("pages") != null) {
			currentPage = Integer.parseInt(request.getParameter("pages").toString());
		}

		filterInfo.put("currentPage", currentPage);
		filterInfo.put("perPageNum", perPageNum);		
		Map map = admin_Criteria.cri(filterInfo);
		int totalCount = adminservice.countBookingList(map);
		
		map.put("totalCount", totalCount);
		Map paging = admin_PageMaker.calcData(filterInfo);
		
		int startPage = Integer.parseInt(paging.get("startPage").toString());
		int endPage = Integer.parseInt(paging.get("endPage").toString());
		int prevPage = Integer.parseInt(paging.get("prevPage").toString());
		int nextPage = Integer.parseInt(paging.get("nextPage").toString());
		boolean next = (boolean) paging.get("next");
		
		Map pageMap = new HashMap();
		pageMap.put("currentPage", currentPage);
		pageMap.put("perPageNum", perPageNum);
		pageMap.put("startPage", startPage);
		pageMap.put("endPage", endPage);
		pageMap.put("prevPage", prevPage);
		pageMap.put("nextPage", nextPage);
		pageMap.put("next", next);
		pageMap.put("method", method);
		model.addAttribute("pageMap", pageMap);	
		
		List<HashMap> list = adminservice.BookingList(map);
		int confCount = adminservice.countBooking(map);
		int cancelCount = adminservice.countcancelBooking(map);
		model.addAttribute("list", list);
		model.addAttribute("count", totalCount);
		model.addAttribute("confcount", confCount);
		model.addAttribute("cancelcount", cancelCount);
		return "admin/bookinglist";
		
	}	
}
