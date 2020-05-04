
package com.itwill.staily.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.itwill.staily.admin.model.Stats;

@Mapper
@Repository("statsMapper")
public interface StatsMapper {
	public int createStats(Stats stats);
	
	public List<Stats>selectTime(String stTime);
	
	public List<Stats>selectBrowser();
}
