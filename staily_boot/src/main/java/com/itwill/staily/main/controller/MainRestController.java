package com.itwill.staily.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.itwill.staily.main.model.dto.Pagination;
import com.itwill.staily.main.service.ListService;
import com.itwill.staily.main.service.MainService;
import com.itwill.staily.mypage.model.dto.Bookmark;
import com.itwill.staily.util.Work;

@Controller
@RequestMapping("/main")
public class MainRestController {
	@Autowired
	private MainService mainService;
	@Autowired
	private ListService listService;
	public MainRestController() {

	}
	@RequestMapping(value="/worklist_select/detail", produces="application/json;charset=UTF-8")
	@ResponseBody 
	public String workListDetail(@RequestParam(name="nextPage",defaultValue = "2") int nextPage, @RequestParam int wNo, HttpServletRequest request, HttpSession session) throws Exception{
	    Gson gson = new Gson();
	    Map map = new HashMap();
		try {
			Integer userNo = (Integer)session.getAttribute("userNo");
			List<Bookmark> bmList = null ;

			if(userNo!=null) {
				bmList = mainService.selectByBookmark(userNo);
			}		
			
	        // 전체리스트 개수
	        int listCnt = listService.selectProductCount(wNo);

	        //페이지 구하기
		    Pagination pagination = new Pagination(listCnt, nextPage);
		    
		    System.out.println(nextPage+"페이지로 넘어갑니다.");
		    System.out.println(pagination.getStartIndex()+"~"+pagination.getCurEndIndex());
		    System.out.println();
		    
		    //조회한 데이터를 가져온다.
		    //list = listService.selectMProductList(wNo,1,2);  
		    List<Work> list = listService.selectMProductList(wNo,pagination.getStartIndex(),pagination.getCurEndIndex());  
		    int endPage = pagination.getEndPage();
		    
			map.put("list", list);
			map.put("endPage",endPage);
			map.put("userNo",userNo);
			map.put("bmList",bmList);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return gson.toJson(map);
	}
	@RequestMapping(value="/worklist_select/episode/detail", produces="application/json;charset=UTF-8")
	@ResponseBody 
	public String workListEpisodeDetail(@RequestParam(name="nextPage",defaultValue = "2") int nextPage, @RequestParam int wNo, @RequestParam int wdEpisode, HttpServletRequest request, HttpSession session) throws Exception{
	    Gson gson = new Gson();
	    Map map = new HashMap();
		try {
			Integer userNo = (Integer)session.getAttribute("userNo");
			List<Bookmark> bmList = null ;

			if(userNo!=null) {
				bmList = mainService.selectByBookmark(userNo);
			}		
			
			// 리스트 개수
			int listCnt = listService.selectProductCountByEpisode(wNo, wdEpisode);
	        //페이지 구하기
		    Pagination pagination = new Pagination(listCnt, nextPage);
		    
			Map map1 = new HashMap();
			map1.put("wNo", wNo);
			map1.put("wdEpisode", wdEpisode);
			map1.put("start",pagination.getStartIndex());
			map1.put("end",pagination.getCurEndIndex());
		    
		    System.out.println(nextPage+"페이지로 넘어갑니다.");
		    System.out.println(pagination.getStartIndex()+"~"+pagination.getCurEndIndex());
		    
		    //조회한 데이터를 가져온다.
		    List<Work> list = listService.selectMProductListByEpisode(map1);
		    int endPage = pagination.getEndPage();
		    
			map.put("list", list);
			map.put("endPage",endPage);
			map.put("userNo",userNo);
			map.put("bmList",bmList);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return gson.toJson(map);
	}
	/************RestController worklist_select/detail*******************/
	/*
	@RequestMapping(value="worklist_select/detail/episode", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String worklist_detail(@RequestParam(name="nextPage",defaultValue = "2") int nextPage,@RequestParam int wNo, @RequestParam int wdEpisode,HttpSession session, HttpServletRequest request) throws Exception{

	    Gson gson = new Gson();
	    Map map = new HashMap();
		try {
			Integer userNo = (Integer)session.getAttribute("userNo");
			List<Bookmark> bmList = null ;
			
			if(userNo!=null) {
				bmList = mainService.selectByBookmark(userNo);
			}
			
			// 리스트 개수
			int listCnt = listService.selectProductCountByEpisode(wNo, wdEpisode);
			
			//페이지 구하기
			Pagination pagination = new Pagination(listCnt, nextPage);
	
			Map map1 = new HashMap();
			map1.put("wNo", wNo);
			map1.put("wdEpisode", wdEpisode);
			map1.put("start",pagination.getStartIndex());
			map1.put("end",pagination.getCurEndIndex());
			    
		    List<Work> mwe = listService.selectMProductListByEpisode(map1);
		    
		    System.out.println(nextPage+"페이지로 넘어갑니다.");
		    System.out.println(pagination.getStartIndex()+"~"+pagination.getCurEndIndex());
	
		    int endPage = pagination.getEndPage();
		    
			map.put("mwe", mwe);
			map.put("endPage",endPage);
			map.put("userNo",userNo);
			map.put("bmList",bmList);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return gson.toJson(map);
	}
	*/
	/************RestController create_bookmark*******************/
	@RequestMapping(value="/create_bookmark", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String createBookmark(@RequestParam int userNo, @RequestParam int pNo) throws Exception{
		String result = "false";
		try {
			
			Map map1 = new HashMap();
			map1.put("mNo", userNo);
			map1.put("pNo", pNo);
			int success = listService.createBookmark(map1);
			if(success==1) {
				result = "true";
			}else {
				result = "false";
			}
			
		}catch (Exception e) {
			result = "false";
		}
		return result;
	}

	/**************Controller delete_bookmark*******************/
	@RequestMapping("/delete_bookmark")
	@ResponseBody
	public String deleteBookmark(@RequestParam int bmNo,@RequestParam int userNo, @RequestParam int pNo, HttpServletRequest request) throws Exception{
		String result = "";
		try {
			int success = listService.deleteBookmark(bmNo);
			if(success==1) {
				result = "true";
			}else {
				result = "false";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	/************RestController select_bookmark*******************/
	@RequestMapping("/select_bookmark")
	@ResponseBody
	public String selectBookmarkNo(@RequestParam int userNo, @RequestParam int pNo, HttpServletRequest request) throws Exception{
		String bmNo = "";
		try {
			bmNo = String.valueOf(listService.selectBookmarkNo(userNo, pNo));
			request.setAttribute("bmNo", bmNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bmNo+","+userNo+","+pNo;
	}
}
