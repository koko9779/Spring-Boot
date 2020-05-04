package com.itwill.staily.detail.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.staily.detail.mapper.ReplyMapper;
import com.itwill.staily.detail.model.dto.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper replyMapper;		

	public ReplyServiceImpl() {
		super();
	}

	public ReplyMapper getReplyMapper() {
		return replyMapper;
	}

	public void setReplyMapper(ReplyMapper replyMapper) {
		this.replyMapper = replyMapper;
	}

	@Override
	public List<Reply> selectReplyList(int pNo) throws Exception {
		return replyMapper.selectReplyList(pNo);
	}
	
	@Override
	public Reply selectReplyOne(int rNo) throws Exception {
		return replyMapper.selectReplyOne(rNo);
	}

	@Override
	@Transactional(isolation = Isolation.READ_UNCOMMITTED, propagation = Propagation.REQUIRED)
	public boolean createReply(Reply reply) throws Exception {
		boolean chk = replyMapper.createReply(reply);
				
		if(chk == true) {
						
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean deleteReply(@Param("rNo") int rNo, @Param("pNo") int pNo, @Param("mNo") int mNo) throws Exception {
		boolean check = false;
		
		if(replyMapper.deleteReply(rNo, pNo, mNo)) {
			check = true;			
		}
		else{
			check = false;
		}
		
		return check;
	}

	@Override
	public boolean deleteReport(int rNo, int pNo) throws Exception {
		boolean check = false;
		
		if(replyMapper.deleteReport(rNo, pNo)) {
			check = true;			
		}
		else{
			check = false;
		}
		
		return check;
	}

	@Override
	public int checkReply(int rNo, int mNo) throws Exception {
		int check = 0;
		
		if(replyMapper.checkReply(rNo, mNo) > 0) {
			check = 1;
		}
		else {
			check = 0;
		}
		
		return check;
	}

	@Override
	public boolean increaseRecommend(int rNo) throws Exception {
		boolean check = false;
		
		if(replyMapper.increaseRecommend(rNo)) {
			check = true;			
		}
		else{
			check = false;
		}
		
		return check;
	}

	@Override
	public boolean increaseReport(int rNo) throws Exception {
		boolean check = false;
		
		if(replyMapper.increaseReport(rNo)) {
			check = true;			
		}
		else{
			check = false;
		}
		
		return check;
	}

	@Override
	public int recommendCheck(int rNo, int mNo) throws Exception {
		int check = 0;
		
		if(replyMapper.recommendCheck(rNo, mNo) == 0) {
			check = 0;
		}
		else {
			check = 1;
		}
		
		return check;
	}

	@Override
	public int reportCheck(int rNo, int mNo) throws Exception {
		int check = 0;
		
		if(replyMapper.reportCheck(rNo, mNo) == 0) {
			check = 0;
		}
		else {
			check = 1;
		}
		
		return check;
	}

	@Override
	public boolean setRecommend(int rNo, int mNo) throws Exception {
		boolean check = false;
		
		if(replyMapper.setRecommend(rNo, mNo)) {
			check = true;
		}
		else {
			check = false;
		}
		
		return check;
	}

	@Override
	public boolean resetRecommend(int rNo, int mNo) throws Exception {
		boolean check = false;

		if(replyMapper.resetRecommend(rNo, mNo)) {
			check = true;
		}
		else {
			check = false;
		}
		
		return check;
	}

	@Override
	public boolean setReport(int rNo, int mNo) throws Exception {
		boolean check = false;

		if(replyMapper.setReport(rNo, mNo)) {
			check = true;
		}
		else {
			check = false;
		}
		
		return check;
	}

	@Override
	public boolean resetReport(int rNo, int mNo) throws Exception {
		boolean check = false;

		if(replyMapper.resetReport(rNo, mNo)) {
			check = true;
		}
		else {
			check = false;
		}
		
		return check;
	}

	@Override
	public boolean createRecommend(int rNo, int mNo) throws Exception {
		boolean check = false;

		if(replyMapper.createRecommend(rNo, mNo)) {
			check = true;
		}
		else {
			check = false;
		}
		
		return check;
	}

	@Override
	public boolean createReport(int rNo, int mNo) throws Exception {
		boolean check = false;

		if(replyMapper.createReport(rNo, mNo)) {
			check = true;
		}
		else {
			check = false;
		}
		
		return check;
	}

	@Override
	public boolean decreaseRecommend(int rNo) throws Exception {
		boolean check = false;

		if(replyMapper.decreaseRecommend(rNo)) {
			check = true;
		}
		else {
			check = false;
		}
		
		return check;
	}

	@Override
	public boolean decreaseReport(int rNo) throws Exception {
		boolean check = false;

		if(replyMapper.decreaseReport(rNo)) {
			check = true;
		}
		else {
			check = false;
		}
		
		return check;
	}

	@Override
	public Reply checkRecAndRep(int rNo, int mNo) throws Exception {
		Reply reply = replyMapper.checkRecAndRep(rNo, mNo);
		
		return reply;
	}



}
