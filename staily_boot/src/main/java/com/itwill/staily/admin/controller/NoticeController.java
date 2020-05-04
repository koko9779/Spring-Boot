package com.itwill.staily.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.staily.admin.model.Stats;
import com.itwill.staily.admin.service.AdminService;
import com.itwill.staily.util.Board;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private AdminService adminService;
	@RequestMapping("/main")
	public String noticeMain(HttpServletRequest request) throws Exception {
		List<Board>noticeList = new ArrayList();
		noticeList = adminService.selectBoardAll();
		request.setAttribute("data", noticeList);
		return "notice/notice_read";
	}
	@RequestMapping("/detail")
	public String noticeDetail(HttpServletRequest request,@RequestParam("bNo")int bNo) throws Exception {
		Board board = adminService.selectBoardOne(bNo);
		request.setAttribute("board", board);
		return"notice/notice_detail";
	}
	
	@RequestMapping("/reply_create")
	@ResponseBody
	public boolean noticeReplyCreate(HttpServletRequest request) throws Exception {
		boolean createOk = false;
		
		String mNo = request.getParameter("mNo");
		String rContent = request.getParameter("rContent");
		Stats stats = new Stats(Integer.parseInt(mNo), rContent);
		try {
			createOk = adminService.createNoticeReply(stats);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return createOk;
	}
	@RequestMapping("/reply_select")
	@ResponseBody
	public List<Stats> noticeReplySelect() throws Exception {
		List<Stats> replyList = new ArrayList();
		try {
			replyList = adminService.selectNoticeReply();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return replyList;
	}
	@RequestMapping("/reply_delete")
	@ResponseBody
	public int noticeReplyDelete(HttpServletRequest request) throws Exception {
		try {
			String nrNo = request.getParameter("nrNo");
			String mNo = request.getParameter("mNo");
			if(adminService.deleteNoticeReply(Integer.parseInt(nrNo), Integer.parseInt(mNo))) {
				return 1;
			}
			else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
}
