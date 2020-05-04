package com.itwill.staily.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.itwill.staily.admin.model.Calendar;

@Repository("calendarMapper")
@Mapper
public interface CalendarMapper {
	
	public List<Calendar> selectCalendarAll();
	
	public Calendar selectCalendar(int cNo);
	
	public boolean createCalendar(Calendar calendar);

	public boolean updateCalendar(Calendar Calendar);
	
	public boolean deleteCalendar(int cNo);
	
}
