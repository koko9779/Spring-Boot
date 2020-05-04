package com.itwill.staily.admin.service;

import java.util.List;

import com.itwill.staily.admin.model.Stats;

public interface StatsService {
	public int createStats(Stats stats) throws Exception;
	
	public List<Stats>selectTime(String stTime)throws Exception;
	
	public List<Stats>selectBrowser() throws Exception;
}
