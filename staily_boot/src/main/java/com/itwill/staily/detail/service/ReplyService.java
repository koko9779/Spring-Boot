package com.itwill.staily.detail.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.staily.detail.model.dto.Reply;

public interface ReplyService {
	List<Reply> selectReplyList(int pNo) throws Exception;
	
	Reply selectReplyOne(int rNo) throws Exception;
	
	boolean createReply(Reply reply) throws Exception;
	
	boolean deleteReply(@Param("rNo") int rNo, @Param("pNo") int pNo, @Param("mNo") int mNo) throws Exception;

	boolean deleteReport(@Param("rNo") int rNo, @Param("pNo") int pNo) throws Exception;
	
	int checkReply(@Param("rNo") int rNo, @Param("mNo") int mNo) throws Exception;
	
	boolean increaseRecommend(int rNo) throws Exception;
	
	boolean increaseReport(int rNo) throws Exception;	
	
	int recommendCheck(@Param("rNo") int rNo, @Param("mNo") int mNo) throws Exception;
	
	int reportCheck(@Param("rNo") int rNo, @Param("mNo") int mNo) throws Exception;

	boolean setRecommend(@Param("rNo") int rNo, @Param("mNo") int mNo) throws Exception;
	
	boolean resetRecommend(@Param("rNo") int rNo, @Param("mNo") int mNo) throws Exception;
	
	boolean setReport(@Param("rNo") int rNo, @Param("mNo") int mNo) throws Exception;
	
	boolean resetReport(@Param("rNo") int rNo, @Param("mNo") int mNo) throws Exception;
		
	boolean createRecommend(@Param("rNo") int rNo, @Param("mNo") int mNo) throws Exception;
	
	boolean createReport(@Param("rNo") int rNo, @Param("mNo") int mNo) throws Exception;
	
	boolean decreaseRecommend(@Param("rNo") int rNo) throws Exception;
	
	boolean decreaseReport(@Param("rNo") int rNo) throws Exception;
	
	Reply checkRecAndRep(@Param("rNo") int rNo, @Param("mNo") int mNo) throws Exception;
}
