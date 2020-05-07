package com.itwill.staily.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.staily.detail.mapper.WorkDetailMapper;
import com.itwill.staily.main.mapper.MainMapper;
import com.itwill.staily.main.service.MainService;
import com.itwill.staily.mypage.model.dto.Bookmark;
import com.itwill.staily.util.Product;
import com.itwill.staily.util.Work;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainMapper mainMapper;
	@Autowired
	private WorkDetailMapper workDetailMapper;
	
	public MainServiceImpl() {
	
	}
	
	public MainMapper getMainMapper() {
		return mainMapper;
	}

	public void setMainMapper(MainMapper mainMapper) {
		this.mainMapper = mainMapper;
	}

	public WorkDetailMapper getWorkDetailMapper() {
		return workDetailMapper;
	}

	public void setWorkDetailMapper(WorkDetailMapper workDetailMapper) {
		this.workDetailMapper = workDetailMapper;
	}

	@Override
	public List<Bookmark> selectByBookmark(int mNo) throws Exception {
		return mainMapper.selectByBookmark(mNo);
	}

	@Override
	public List<Product> selectByView() throws Exception {
		return mainMapper.selectByView();
	}

	@Override
	public List<Work> selectByCategory(String category) throws Exception {
		return mainMapper.selectByCategory(category);
	}

	@Override
	public List<Work> selectTodayOfWork() throws Exception {
		return mainMapper.selectTodayOfWork();
	}
	
}