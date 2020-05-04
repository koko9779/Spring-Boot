package com.itwill.staily.stylecoodination.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.staily.stylecoodination.service.StyleCoodinationService;
import com.itwill.staily.util.Board;

@Controller
@RequestMapping("/style")
public class StyleCoodinationController {
	@Autowired
	 private StyleCoodinationService styleCoodinationService;
	
	//스타일 Q&A 전체보기, 자유게시판, 1:1 문의 모두 들어가는 컨트롤러
	@RequestMapping("/style_main_read")
	public String style_main_all(HttpServletRequest request , Model model) {
		String bType = "";
		List<Board> data = new ArrayList<Board>();
		//int boardCount = 0;
		int replyCount = 0;
		
		bType = request.getParameter("bType");
		if(bType == null) {
			bType = "S";
		}
		
		data = styleCoodinationService.findBoardAll(bType);
		//boardCount = styleCoodinationService.findBoardCount();
		replyCount = styleCoodinationService.findBoardReplyCount(bType);
		
		model.addAttribute("data", data);
		model.addAttribute("boardCount", data.size());
		model.addAttribute("replyCount", replyCount);
		model.addAttribute("bType", bType);
		
		return "style/style_main_read";
	}
	
	
	// 스타일 Q&A 카테고리별
	@RequestMapping("/style_main_read_category")
	public String style_main_category(Board b,Model model) {
		String bType = "S";
		List<Board> data = new ArrayList<Board>();
		//int boardCount = 0;
		int replyCount = 0;
		
		data = styleCoodinationService.findBoardCategory(b);
		//boardCount = styleCoodinationService.findBoardCategoryCount(b);
		replyCount = styleCoodinationService.findBoardReplyCategoryCount(b);
		
		model.addAttribute("data", data);
		model.addAttribute("boardCount", data.size());
		model.addAttribute("replyCount", replyCount);
		model.addAttribute("bType", bType);
		
		return "style/style_main_read";
	}
	
	
	// Top 10 
	@RequestMapping("/style_main_read_top10")
	public String style_main_top10(Model model) {
		String bType = "S";
		List<Board> data = new ArrayList<Board>();
		int replyCount = 0;
		
		data = styleCoodinationService.findBoardTop10();
		replyCount = styleCoodinationService.selectBoardTop10ReplyCount();
		
		model.addAttribute("data", data);
		model.addAttribute("boardCount", data.size());
		model.addAttribute("replyCount", replyCount);
		model.addAttribute("bType", bType);
		
		return "style/style_main_read";
	}
	
	@RequestMapping("/style_detail_read")
	public String style_view(@RequestParam String bNo, Model model, HttpSession session) {
		List<Board> boardOneList = new ArrayList<Board>();
		String forwardPath ="";
		int intBNo = Integer.parseInt(bNo);
		Integer userNo;
		
		
		try {
			if(session.getAttribute("userNo") != null) {
				userNo = (Integer)session.getAttribute("userNo");	
			} else {
				userNo = 0;				
			}
			
			styleCoodinationService.updateViewCount(intBNo);
			boardOneList = styleCoodinationService.findBoardOne(intBNo, userNo);
			model.addAttribute("boardOneList", boardOneList);
			forwardPath = "style/style_detail_read";
		} catch(Exception e) {
			e.printStackTrace();
			forwardPath = "redirect:/404.jsp";
		}
		return forwardPath;
	}
	
	@RequestMapping("/style_board_update")
	public String style_update(@RequestParam String bNo, Model model) {
		int intBNo = Integer.parseInt(bNo);
		Board updateBoard;
		
		updateBoard = styleCoodinationService.selectUpdateBoard(intBNo);
		model.addAttribute("updateBoard", updateBoard);
		
		return "style/style_update";
	}
	
	@RequestMapping("/style_board_create")
	public String style_create(Board board) {
		return "style/style_board_create";
	}
	
	@RequestMapping(value = "/style_create_board_action", method = RequestMethod.POST)
	public String style_create_action_post(@ModelAttribute Board board, HttpSession session) {
		String forwardPath = "";
		int userNo;
		try {
			userNo = (int)session.getAttribute("userNo");
			board.setmNo(userNo);
			styleCoodinationService.writeBoard(board);
			
			if(board.getbType().equals("S")) {
				forwardPath = "redirect:/style/style_main_read";
			} else if(board.getbType().equals("F")) {
				forwardPath = "redirect:/style/style_main_read?bType=F";
			} else if(board.getbType().equals("Q")) {
				forwardPath = "redirect:/style/style_main_read?bType=Q";
			}
		} catch (Exception e) {
			e.printStackTrace();
			forwardPath = "redirect:/404.jsp";
		}
		return forwardPath;
	}
	
	
	@RequestMapping(value="/style_board_delete_action", method = RequestMethod.POST)
	public String style_board_delete_action_post(@RequestParam String bNo) {
		String forwardPath = "";
		int intBNo = Integer.parseInt(bNo);
		
		try {
			styleCoodinationService.removeBoard(intBNo);
			forwardPath = "redirect:/style/style_main_read";
		} catch (Exception e) {
			e.printStackTrace();
			forwardPath = "redirect:/404.jsp";
		}
		return forwardPath;
	}
	
	

	
}
