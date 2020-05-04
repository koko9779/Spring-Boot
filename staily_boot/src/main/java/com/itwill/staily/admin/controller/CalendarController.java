
package com.itwill.staily.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.itwill.staily.admin.model.Calendar;
import com.itwill.staily.admin.service.CalendarService;

@RestController
@RequestMapping("/admin")
public class CalendarController {
	@Autowired
	private CalendarService calendarService;
	
	@RequestMapping(value = "/select_calendar_list")
	public String selectCalendarList(HttpServletRequest request,HttpServletResponse response,Calendar calendar) throws Exception {
		Gson gson = new Gson();
		List<Calendar> list= calendarService.selectCalendarAll(); 
		String result = gson.toJson(list);
		System.out.println(result);
		/*
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", list);
		JSONObject json = new JSONObject(result);
		response.setHeader("Content-Type", "application/json;charset=utf-8");
		response.setHeader("Accept", "application/json");
		*/
		return result;
	}
	@RequestMapping("/select_calendar")
	public Calendar selectCalendar(int cNo) throws Exception {
		Calendar calendar = calendarService.selectCalendar(cNo);
		return calendar;
	}
	@RequestMapping("/create_calendar")
	public String createCalendar (Calendar calendar) {
		
		String result = "";
		System.out.println(calendar);
		try {
			calendarService.createCalendar(calendar);
			result = "success";
			
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}
	@RequestMapping("/delete_calendar")
	public String deleteCalendar (int cNo) {
		String result = "";
		try {
			calendarService.deleteCalendar(cNo);
			result = "success";
			
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}
	@RequestMapping("/update_calendar")
	public String updateCalendar (Calendar calendar) {
		String result = "";
		try {
			calendarService.updateCalendar(calendar);
			result = "success";
			
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}
}
