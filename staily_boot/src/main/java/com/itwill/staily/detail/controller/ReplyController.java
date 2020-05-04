package com.itwill.staily.detail.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.itwill.staily.detail.model.dto.Reply;
import com.itwill.staily.detail.service.ReplyService;
import com.itwill.staily.mypage.mapper.FriendMapper;
import com.itwill.staily.mypage.model.dto.Friend;
import com.itwill.staily.mypage.service.FriendService;

@SuppressWarnings("unused")
@RequestMapping("/detail")
@RestController
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private FriendService friendService;
	
	public ReplyController() {
		
	}
	
	@RequestMapping("/reply_list")
	public List<Reply> reply_list(HttpServletRequest request, HttpServletResponse response, String pNo) throws Exception {
		
		List<Reply> rL = replyService.selectReplyList(Integer.parseInt(pNo));
		request.setAttribute("replyList", rL);
				
		return rL;			
	}
	
	@RequestMapping("/reply_create")
	public Reply reply_create(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		try {			
			String pNo = request.getParameter("pNo");
			String wNo = request.getParameter("wNo");
			Integer mNo = (Integer)session.getAttribute("userNo");
			String rContent = request.getParameter("rContent");
						
			request.setAttribute("pNo", pNo);
			Reply reply = new Reply(Integer.parseInt(pNo), mNo, rContent);
			request.setAttribute("reply", reply);
			request.setAttribute("wNo", wNo);
			replyService.createReply(reply);
			
			return reply;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}
	
	
	
	@RequestMapping("/reply_delete")
	public int reply_delete(HttpServletRequest request, HttpServletResponse response) {
		try {
			String rNo = request.getParameter("rNo");
			String pNo = request.getParameter("pNo");
			String mNo = request.getParameter("mNo");
			
			System.out.println(rNo + "---" + pNo + "---" + mNo);
			
			boolean delete = replyService.deleteReply(Integer.parseInt(rNo), Integer.parseInt(pNo), Integer.parseInt(mNo));
			
			if(delete) {
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
	
	@RequestMapping("/reply_recommend")
	public int reply_recommend(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		try {
			Integer mNo = (Integer)session.getAttribute("userNo");
			String rNo = request.getParameter("rNo");
			
			if(replyService.checkReply(Integer.parseInt(rNo), mNo) > 0) {
				//사용자가 추천을 눌렀는지 확인(DB에 있는지)
				//있으면 추천 컬럼 확인
				if(replyService.recommendCheck(Integer.parseInt(rNo), mNo) > 0) {
					//추천을 감소시키고 컬럼을 0으로 설정
					replyService.decreaseRecommend(Integer.parseInt(rNo));
					replyService.resetRecommend(Integer.parseInt(rNo), mNo);
					//System.out.println(replyService.selectReplyOne(Integer.parseInt(rNo)).toString() + " 1번");
					return 1; //1번
				}
				else {
					//추천을 증가시키고 컬럼을 1로 설정
					replyService.increaseRecommend(Integer.parseInt(rNo));
					replyService.setRecommend(Integer.parseInt(rNo), mNo);
					//System.out.println(replyService.selectReplyOne(Integer.parseInt(rNo)).toString() + " 2번");
					return 2; //2번
				}					
			}
			else {
				//없으면 DB에 생성
				replyService.createRecommend(Integer.parseInt(rNo), mNo);
				
				//추천을 증가시키고 컬럼을 1로 설정
				replyService.increaseRecommend(Integer.parseInt(rNo));
				replyService.setRecommend(Integer.parseInt(rNo), mNo);
				//System.out.println(replyService.selectReplyOne(Integer.parseInt(rNo)).toString() + " 3번");
				return 3; //3번						
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0; //실패
		}
	}
	
	@RequestMapping("/reply_report")
	public int reply_report(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		try {
			Integer mNo = (Integer)session.getAttribute("userNo");
			String pNo = request.getParameter("pNo");
			String rNo = request.getParameter("rNo");
			
			//신고 수가 누적되면 댓글 삭제
			int reportCnt = replyService.selectReplyOne(Integer.parseInt(rNo)).getrReport();
			//System.out.println(reportCnt);
			if(reportCnt >= 2) {
				replyService.deleteReport(Integer.parseInt(rNo), Integer.parseInt(pNo));
				return 2;
			}
			
			if(replyService.checkReply(Integer.parseInt(rNo), mNo) > 0) {
				//사용자가 추천을 눌렀는지 확인(DB에 있는지)
				//있으면 추천 컬럼 확인
				if(replyService.reportCheck(Integer.parseInt(rNo), mNo) > 0) {
					//추천을 감소시키고 컬럼을 0으로 설정
					replyService.decreaseReport(Integer.parseInt(rNo));
					replyService.resetReport(Integer.parseInt(rNo), mNo);
					//System.out.println(replyService.selectReplyOne(Integer.parseInt(rNo)).toString() + " 1번");
					return 1;
				}
				else {
					//추천을 증가시키고 컬럼을 1로 설정
					replyService.increaseReport(Integer.parseInt(rNo));
					replyService.setReport(Integer.parseInt(rNo), mNo);
					//System.out.println(replyService.selectReplyOne(Integer.parseInt(rNo)).toString() + " 2번");
					return 1;
				}					
			}
			else {
				//없으면 DB에 생성
				replyService.createReport(Integer.parseInt(rNo), mNo);
				
				//추천을 증가시키고 컬럼을 1로 설정
				replyService.increaseReport(Integer.parseInt(rNo));
				replyService.setReport(Integer.parseInt(rNo), mNo);
				//System.out.println(replyService.selectReplyOne(Integer.parseInt(rNo)).toString() + " 3번");
				return 1;						
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}


	@RequestMapping("/reply_check")
	public int reply_check(HttpServletRequest request, HttpServletResponse response, String pNo) throws Exception {
		int check = 0;
		
		try {
			String rNo = request.getParameter("rNo");
			String mNo = request.getParameter("mNo");
			
			Reply reply = replyService.checkRecAndRep(Integer.parseInt(rNo), Integer.parseInt(mNo));
			
			if(replyService.checkReply(Integer.parseInt(rNo), Integer.parseInt(mNo)) > 0) {
				if(reply.getrRecommend() > 0) {
					if(reply.getrReport() > 0) {
						//사용자가 추천과 신고를 눌렀을 경우
						check = 0;
					}
					else {
						//사용자가 추천은 눌렀지만 신고를 누르지 않은 경우
						check = 1;
					}
				}
				else {
					if(reply.getrReport() > 0) {
						//사용자가 추천은 누르지 않았지만 신고를 누른 경우
						check = 2;
					}
					else {
						//사용자가 추천과 신고를 둘 다 누르지 않은 경우
						check = 3;
					}
				}
			}
			else {
				check = 3;
			}
		} catch (Exception e) {
			e.printStackTrace();
			check = 4; //에러
		}
				
		return check;			
	}
}
