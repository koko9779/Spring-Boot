package com.itwill.staily.detail.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwill.staily.util.Work;

@Mapper
public interface WorkDetailMapper {
	public Work selectWorkOne(int wNo);
	
	public List<Work> selectWorkAll();
	
	public boolean createWorkDetail(@Param("wNo") int wNo, @Param("wdEpisode") int wdEpisode);
	
	public int selectTepisode(int wNo);
	
	public boolean increaseWorkView(int wNo);
	
}
