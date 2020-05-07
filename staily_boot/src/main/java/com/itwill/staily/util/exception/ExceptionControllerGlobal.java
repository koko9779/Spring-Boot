package com.itwill.staily.util.exception;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionControllerGlobal {
	
	@ExceptionHandler(Exception.class)
	public ModelAndView exception(HttpServletRequest req, Exception e) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("msg", e.getMessage());
		modelAndView.addObject("url",req.getRequestURL());
		modelAndView.setViewName("error");
		return modelAndView;
	}
}
