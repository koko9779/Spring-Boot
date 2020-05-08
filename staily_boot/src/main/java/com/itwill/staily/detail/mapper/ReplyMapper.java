package com.itwill.staily.detail.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwill.staily.detail.model.dto.Reply;
@Mapper
public interface ReplyMapper {
	public List<Reply> selectReplyList(int pNo);
	
	public Reply selectReplyOne(int rNo);
	
	public boolean createReply(Reply reply);
	
	public boolean deleteReply(@Param("rNo") int rNo, @Param("pNo") int pNo, @Param("mNo") int mNo);
	
	public boolean deleteReport(@Param("rNo") int rNo, @Param("pNo") int pNo);
	
	public int checkReply(@Param("rNo") int rNo, @Param("mNo") int mNo);
	
	public boolean increaseRecommend(int rNo);
	
	public boolean increaseReport(int rNo);
	
	public int recommendCheck(@Param("rNo") int rNo, @Param("mNo") int mNo);
	
	public int reportCheck(@Param("rNo") int rNo, @Param("mNo") int mNo);
	
	public boolean setRecommend(@Param("rNo") int rNo, @Param("mNo") int mNo);
	
	public boolean resetRecommend(@Param("rNo") int rNo, @Param("mNo") int mNo);
	
	public boolean setReport(@Param("rNo") int rNo, @Param("mNo") int mNo);
	
	public boolean resetReport(@Param("rNo") int rNo, @Param("mNo") int mNo);
		
	public boolean createRecommend(@Param("rNo") int rNo, @Param("mNo") int mNo);
	
	public boolean createReport(@Param("rNo") int rNo, @Param("mNo") int mNo);
	
	public boolean decreaseRecommend(@Param("rNo") int rNo);
	
	public boolean decreaseReport(@Param("rNo") int rNo);
	
	public Reply checkRecAndRep(@Param("rNo") int rNo, @Param("mNo") int mNo);
}
