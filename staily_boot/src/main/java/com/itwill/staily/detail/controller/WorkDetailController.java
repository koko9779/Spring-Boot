package com.itwill.staily.detail.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itwill.staily.detail.service.WorkDetailService;
import com.itwill.staily.util.Work;

@Controller
@RequestMapping("/detail")
public class WorkDetailController {
	@Autowired
	private WorkDetailService workDetailService;
	
	@ResponseBody
	@RequestMapping("/work_confirm")
	public Work selectWorkOne(HttpServletRequest request, HttpServletResponse response, String wNo) throws Exception {
		Work w = workDetailService.selectWorkOne(Integer.parseInt(wNo));
		
		request.setAttribute("workOne", w);	
		
		
		return w;
	}
	
	
	@RequestMapping("/work_request")
	public ModelAndView selectWork(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		
		try {
			String wNo = request.getParameter("wNo");
			Work w = workDetailService.selectWorkOne(Integer.parseInt(wNo));
			request.setAttribute("workOne", w);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("detail/product_create");
		
		return mv;		
	}
	
	
	@RequestMapping("/work_select")
	public ModelAndView selectWorkAll(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		
		try {
			List<Work> wL = workDetailService.selectWorkAll();
			request.setAttribute("data", wL);			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("detail/work_select");
		
		return mv;		
	}
	
	/*
	@RequestMapping("/detailtest")
	public ModelAndView createWorkDetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		
		try {
			String pNo = request.getParameter("pNo");
			String wNo = request.getParameter("wNo");
			String wdEpisode = request.getParameter("wdEpisode");
			
			boolean create = workDetailService.createWorkDetail(Integer.parseInt(pNo), 
					Integer.parseInt(wNo), Integer.parseInt(wdEpisode));

			if(create) {
				mv.setViewName("detailtest");			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return mv;		
	}
	*/
	/*
	@RequestMapping("/detailtest")
	public ModelAndView selectTepisode(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		
		try {
			String wNo = request.getParameter("wNo");
			
			int te = workDetailService.selectTepisode(Integer.parseInt(wNo));
			request.setAttribute("te", te);
			
			mv.setViewName("detailtest");			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return mv;		
	}
	*/
	/*
	@RequestMapping("/detailtest")
	public ModelAndView increaseWorkView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		
		try {
			String wNo = request.getParameter("wNo");
			
			boolean iV = workDetailService.increaseWorkView(Integer.parseInt(wNo));
			Work iW = workDetailService.selectWorkOne(Integer.parseInt(wNo));
			
			request.setAttribute("iW", iW.getwView());
			
			mv.setViewName("detailtest");			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return mv;		
	}
	*/
}
