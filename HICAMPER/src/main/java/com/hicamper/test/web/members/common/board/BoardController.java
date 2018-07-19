package com.hicamper.test.web.members.common.board;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hicamper.test.etc.search.filter.Criteria;
import com.hicamper.test.etc.search.filter.PageMaker;
import com.hicamper.test.web.members.common.board.Paging;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hicamper.test.web.members.common.board.Paging;

import com.hicamper.test.web.members.common.board.service.BoardService;
import com.hicamper.test.web.members.common.board.service.CommentListService;



@RequestMapping(value="/board")
@Controller
public class BoardController {
		
	@Resource(name="boardService")
	BoardService boardService;
	
	@Autowired
	private CommentListService commentservice;
	
	Paging pagemaker;
	
	
	
		
	/*---------게시판 board----------*/
	@RequestMapping(value="/addform")
	public String writeBoardForm(HttpSession session, @RequestParam Map map) throws Exception{
		String page = "";
		String user = (String) session.getAttribute("id");
		
		if (user != null)
			page = "common/customerService/boardform";
		else if(user == null)
			page = "redirect:/common/login";		
		
		return page;
	}
	
	
	@RequestMapping(value="/add", method =RequestMethod.POST)
	public String wirteBoard(Model model, @RequestParam Map map, HttpSession session) throws Exception{
		String page = "";
		String user = (String) session.getAttribute("id");
		map.put("user_id", user);
		
		if (user != null) {
			int count = boardService.BinsertPost(map);
			page = "redirect:/board/detail?board_group=" + map.get("board_group") + "&idx=" + map.get("idx");
		} else if(user == null) {
			page = "redirect:/common/login";
		}
		
		return page;
	}
	
	@RequestMapping(value="/showlist")
	public String listBoard(Model model, HttpServletRequest req, @RequestParam int board_group, @RequestParam Map filterInfo) throws Exception {
		int currentPage = 1;
		int perPageNum = 3;		
	
		if(req.getParameter("pages") != null) {
			currentPage = Integer.parseInt(req.getParameter("pages").toString());
		}
		
		filterInfo.put("currentPage", currentPage);
		filterInfo.put("perPageNum", perPageNum);
		Map map = Criteria.cri(filterInfo);
		int totalCount = boardService.getCount(board_group);
		
		map.put("totalCount", totalCount);
		Map paging = PageMaker.calcData(filterInfo);
		
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

		List<WriteInfo> info = boardService.BpostList(map);			
		model.addAttribute("board", info);
		
		String boardName = getBoardName(map);
		model.addAttribute("boardName", boardName);
		
		if (board_group == 5 || board_group == 6) {
			return "common/customerService/board-notice";
		}
						
		return "common/customerService/board";
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
	
	@RequestMapping(value="/detail", method= {RequestMethod.POST, RequestMethod.GET})
	public String viewBoard(@RequestParam long idx, @RequestParam int board_group, Map map, Model model, HttpSession session, @RequestParam Map map2) throws Exception{
		Map idxMap = new HashMap<>();
		idxMap.put("idx", idx);		
		boardService.increaseHit(idxMap);		
		
		ArrayList<WriteInfo> list = new ArrayList<WriteInfo>();
		list = (ArrayList<WriteInfo>) boardService.BPNPostList(idx);
		Map<String, Object> detail = new HashMap<String, Object>();
		detail = boardService.BdetailPost(board_group, idx);
		session.setAttribute("idx", idx);
		session.setAttribute("board_group", board_group);
		
		map.put("board_group", detail);
		map.put("list", list);		
		map.put("id", session.getAttribute("id"));
		model.addAttribute("id", session.getAttribute("id"));
		
		List<HashMap> comlist = commentservice.showComment(map2);
		model.addAttribute("comlist", comlist);		
		model.addAttribute("title", detail.get("title"));
		
		if (board_group == 5 || board_group == 6) {
			return "common/customerService/board-detail-notice";
		}
		
		if (board_group == 7) {
			return "common/customerService/board-detail-1on1";
		}
		
		return "common/customerService/boarddetail";
	}
	
	@RequestMapping(value = "/modifyform", method= {RequestMethod.POST, RequestMethod.GET})
	public String modifyBoardForm(@RequestParam long idx, HttpSession session, @RequestParam int board_group, Map<String, Object> map) throws Exception{
		String page = "";
		String user = (String) session.getAttribute("id");
		String content = "";
		
		if (user != null) {									
			Map<String, Object> info = boardService.BdetailPost(board_group, idx);					
			map.put("board", info);	
			page = "/common/customerService/boardupdateform";
		} else if (user == null) { 
			page ="redirect:/common/login";	
		}
		
		return page;
	}
	
	@RequestMapping(value = "/modify", method= {RequestMethod.POST, RequestMethod.GET})
	public String modifyBoard(HttpServletRequest req,HttpSession session, Map map,@RequestParam int board_group) throws Exception{
		String page = "";
		String user = (String) session.getAttribute("id");
		
		if (user == null) {
			page = "redirect:common/login";
		}
		
		if (user != null) {		
			Map<String, String> insertValue = new HashMap<String, String>();
			insertValue.put("idx", req.getParameter("idx"));
			insertValue.put("board_group", req.getParameter("board_group"));
			insertValue.put("title", req.getParameter("title").replaceAll("<[^>]*>",""));
			insertValue.put("content", req.getParameter("content").replaceAll("(?i)<script","&lt;script"));
	
			boardService.BupdatePost(insertValue);
			
			if (board_group == 1) {
				page = "redirect:showlist?board_group=1";
			} else if(board_group == 2) {
				page = "redirect:showlist?board_group=2";
			} else if(board_group == 3) {
				page = "redirect:showlist?board_group=3";
			} else if(board_group == 5) {
				page = "redirect:showlist?board_group=5";
			} else if(board_group == 6) {
				page = "redirect:showlist?board_group=6";
			} else {
				page = "redirect:showlist?board_group=7";
			}
		} 
		
		return  page ;
	}
	
	@RequestMapping(value="/delete", method= {RequestMethod.POST, RequestMethod.GET})
	public String deleteBoard(@RequestParam Map<String, String> info, @RequestParam int board_group) throws Exception  {
		String page ="";
		boardService.BdeletePost(info);
		if (board_group ==1) {
			page = "redirect:showlist?board_group=1";
		} else if(board_group == 2) {
			page = "redirect:showlist?board_group=2";
		} else if(board_group == 3) {
			page = "redirect:showlist?board_group=3";
		} else if(board_group == 5) {
			page = "redirect:showlist?board_group=5";
		} else if(board_group == 6) {
			page = "redirect:showlist?board_group=6";
		} else {
			page = "redirect:showlist?board_group=7";
		}
		return page;
	}
	
//-----------------------------comment---------------------------------------------------------------//
	
	@RequestMapping(value="/writecomment", method={RequestMethod.POST, RequestMethod.GET})
	public String writeComment(Model model, @RequestParam Map map, HttpSession httpsession)  {
		map.put("id", httpsession.getAttribute("id"));
		map.put("idx", httpsession.getAttribute("idx"));
		map.put("board_group", httpsession.getAttribute("board_group"));
		int result = commentservice.writeComment(map);
		model.addAttribute("result", result);
		return "common/board/writecomment";	
	}
	
	@RequestMapping(value="/showupdate_form", method={RequestMethod.POST, RequestMethod.GET})
	public String showupdate_Ment(Model model, @RequestParam Map map, HttpSession httpsession)  {
		List<HashMap> list = commentservice.showUpdate_form(map);
		model.addAttribute("list", list);
		return "common/board/showupdate_form";	
	}
	
	@RequestMapping(value="/updatecomment", method={RequestMethod.POST, RequestMethod.GET})
	public String updateComment(Model model, @RequestParam Map map, HttpSession httpsession)  {
		int result = commentservice.updateComment(map);
		model.addAttribute("result", result);
		return "common/board/updatecomment";	
	}
	
	@RequestMapping(value="/deletecomment", method={RequestMethod.POST, RequestMethod.GET})
	public String deleteComment(Model model, @RequestParam Map map, HttpSession httpsession)  {
		int result = commentservice.deleteComment(map);
		model.addAttribute("result", result);
		return "common/board/deletecomment";	
	}
	
	//-----------------------------Terms---------------------------------------------------------------//
	
	@RequestMapping(value="/termsofservice", method={RequestMethod.POST, RequestMethod.GET})
	public String termsOfService()  {
		return "common/term/termsofservice";	
	}
	
}
