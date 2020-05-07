package com.itwill.staily.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.staily.admin.mapper.CalendarMapper;
import com.itwill.staily.admin.model.Calendar;
import com.itwill.staily.admin.service.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {
	@Autowired
	private CalendarMapper calendarMapper;
	
	
	@Override
	public List<Calendar> selectCalendarAll() throws Exception {
		return calendarMapper.selectCalendarAll();
	}

	@Override
	public Calendar selectCalendar(int cNo) throws Exception {
		return calendarMapper.selectCalendar(cNo);
	}

	@Override
	public boolean updateCalendar(Calendar Calendar) throws Exception {
		return calendarMapper.updateCalendar(Calendar);
	}

	@Override
	public boolean deleteCalendar(int cNo) throws Exception {
		return calendarMapper.deleteCalendar(cNo);
	}

	@Override
	public boolean createCalendar(Calendar calendar) throws Exception {
		return calendarMapper.createCalendar(calendar);
	}

}
