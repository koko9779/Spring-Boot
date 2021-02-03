package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.Board;
import com.example.demo.dto.Pagination;
import com.example.demo.mgr.BoardServiceImpl;

@Controller
public class BoardController {
	
	final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private BoardServiceImpl boardServiceImpl;
	
	/*
	 * 게시판 목록
	 */
	@RequestMapping(value = "/boardList")
	public String getBoardList(Model model
							,@RequestParam(required = false, defaultValue = "1") int page
							,@RequestParam(required = false, defaultValue = "1") int range
							) throws Exception{
		
		//전체 게시글 개수
		int listCnt = boardServiceImpl.getBoardListCnt();
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination",pagination);
		model.addAttribute("list",boardServiceImpl.getBoardList(pagination));
		
		return "board/getBoardList";
	}
	
    /*
     * 게시판 상세페이지
     */
    @RequestMapping(value="/boardDetail")
    public String viewForm(Model model, HttpServletRequest request) throws Exception{
        int boardnum = Integer.parseInt(request.getParameter("boardnum"));
        model.addAttribute("board", boardServiceImpl.getBoardDetail(boardnum));       
        return "board/boardDetail";
    }
    
    /*
     * 게시판 수정페이지
     */
    @RequestMapping(value="/boardModify")
    public String ModifyForm(Model model, HttpServletRequest request) throws Exception{
    	int boardnum = Integer.parseInt(request.getParameter("boardnum"));
    	model.addAttribute("board", boardServiceImpl.getBoardDetail(boardnum));    	
    	return "board/boardModify";
    }
	
    /*
     * 게시판 글쓰기페이지
     */
    @RequestMapping(value="/boardForm")
    public String boardForm(HttpSession session){   	
    	String userId = (String) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/boardList";
		}
        return "board/boardForm";
    }
    
    /*
     * 게시판 글쓰기 처리
     */
    @RequestMapping(value="/insertBoard", method = RequestMethod.POST)
    public String write(@ModelAttribute Board board) throws Exception {
        boardServiceImpl.insertBoard(board);
        return "redirect:boardList";
    }
    
    /*
     * 게시판 글수정 처리
     */
    @RequestMapping(value="/updateBoard")
    public String updateBoard(@ModelAttribute("board") Board board) throws Exception {
    	boardServiceImpl.updateBoard(board);
        return "redirect:boardDetail?boardnum="+board.getBoardnum();
    }
    
    /*
     * 게시판 글삭제 처리
     */
    @RequestMapping(value="/deleteBoard")
    public String deleteBoard(HttpServletRequest request) throws Exception {
        int boardnum = Integer.parseInt(request.getParameter("boardnum"));
        boardServiceImpl.deleteBoard(boardnum);
        return "redirect:boardList";
    }

}
