package com.itwill.staily.admin.service;

import java.util.List;

import com.itwill.staily.admin.model.Calendar;

public interface CalendarService {
	public List<Calendar> selectCalendarAll() throws Exception; 
	
	public Calendar selectCalendar(int cNo) throws Exception;
	
	public boolean updateCalendar(Calendar Calendar) throws Exception;
	
	public boolean deleteCalendar(int cNo) throws Exception;
	
	public boolean createCalendar(Calendar calendar) throws Exception;
}
