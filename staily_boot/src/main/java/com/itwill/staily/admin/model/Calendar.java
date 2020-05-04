package com.itwill.staily.admin.model;

/*
    "title": "거래처 미팅",
    "description": "Lorem ipsum dolor sit incid idunt ut Lorem ipsum sit.",
    "start": "2019-05-07T09:30",
    "end": "2019-05-07T15:00",
    "type": "카테고리1",
    "username": "다현",
    "backgroundColor": "#D25565",
    "textColor": "#ffffff",
    "allDay": false
 */
/**
 * @author Shaden
 *
 */
public class Calendar {
	private int _id;
	private String title;
	private String description;
	private String start;
	private String end;
	private String type;
	private String username;
	private String backgroundColor;
	private String textColor;
	private String allDay;
	
	public Calendar() {
		// TODO Auto-generated constructor stub
	}

	public Calendar(int _id, String title, String description, String start, String end, String type, String username,
			String backgroundColor, String textColor, String allDay) {
		super();
		this._id = _id;
		this.title = title;
		this.description = description;
		this.start = start;
		this.end = end;
		this.type = type;
		this.username = username;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
		this.allDay = allDay;
	}

	public int get_id() {
		return _id;
	}

	public void set_id(int _id) {
		this._id = _id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public String getAllDay() {
		return allDay;
	}

	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}

	@Override
	public String toString() {
		return "Calendar [_id=" + _id + ", title=" + title + ", description=" + description + ", start=" + start
				+ ", end=" + end + ", type=" + type + ", username=" + username + ", backgroundColor=" + backgroundColor
				+ ", textColor=" + textColor + ", allDay=" + allDay + "]";
	}
	

}