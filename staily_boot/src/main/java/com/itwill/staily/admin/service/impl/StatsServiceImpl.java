package com.itwill.staily.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.staily.admin.mapper.StatsMapper;
import com.itwill.staily.admin.model.Stats;
import com.itwill.staily.admin.service.StatsService;

@Service
public class StatsServiceImpl implements StatsService {
	@Autowired
	private StatsMapper statsMapper; 
	@Override
	public int createStats(Stats stats) throws Exception {
		return statsMapper.createStats(stats);
	}
	@Override
	public List<Stats> selectTime(String stTime) throws Exception {
		return statsMapper.selectTime(stTime);
	}
	@Override
	public List<Stats> selectBrowser() throws Exception {
		return statsMapper.selectBrowser();
	}

}
