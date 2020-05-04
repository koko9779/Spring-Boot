package com.itwill.staily.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.plugins.bmp.BMPImageWriteParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StopWatch;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.itwill.staily.main.model.dto.Pagination;
import com.itwill.staily.main.service.ListService;
import com.itwill.staily.main.service.MainService;
import com.itwill.staily.mypage.model.dto.Bookmark;
import com.itwill.staily.util.Product;
import com.itwill.staily.util.Work;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	private MainService mainService;
	@Autowired
	private ListService listService;

	public MainController() {
		
	}
	/************Controller index*******************/
	@RequestMapping("/index")
	public String index(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			
			Integer userNo = (Integer)session.getAttribute("userNo");
			request.setAttribute("userNo", userNo);							
			
			if(userNo!=null) {
				List<Bookmark> bmList = mainService.selectByBookmark(userNo);
				request.setAttribute("bmList", bmList);		
			}

			List<Product> hotList = mainService.selectByView();
			request.setAttribute("hotList", hotList);
			
			List<Work> todayList = mainService.selectTodayOfWork();
			request.setAttribute("todayList", todayList);
			
			List<Work> dramaList = mainService.selectByCategory("D");
			request.setAttribute("dramaList", dramaList);
			
			List<Work> movieList = mainService.selectByCategory("M");
			request.setAttribute("movieList", movieList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "index";
	}
	/************Controller productlist_select*******************/
	@RequestMapping("/productlist_select")
	public String productlist(HttpServletRequest request, HttpSession session) throws Exception {
		try {
	        /*****************로그인 여부********************/
	        //사용자 정보 session을 통해서 가져오기
	        Integer userNo = (Integer)session.getAttribute("userNo");
	        request.setAttribute("userNo", userNo);	
	        
			if(userNo!=null) {
				List<Bookmark> bmList = mainService.selectByBookmark(userNo);
				request.setAttribute("bmList", bmList);	
			}
			
			List<Work> productList = listService.selectProductList();
			request.setAttribute("pList", productList);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "main/productlist";
	}
	/************Controller worklist_select*******************/
	@RequestMapping("/worklist_select")
	public String workList(@RequestParam int wNo, @RequestParam(defaultValue="1") int curPage, HttpServletRequest request, HttpSession session) throws Exception {
		try {
						
			//작품 조회수 증가
			listService.increaseWorkView(wNo);
	        
	        /*****************로그인 여부********************/
	        //사용자 정보 session을 통해서 가져오기
	        Integer userNo = (Integer)session.getAttribute("userNo");
	        request.setAttribute("userNo", userNo);	
	        
			if(userNo!=null) {
				List<Bookmark> bmList = mainService.selectByBookmark(userNo);
				request.setAttribute("bmList", bmList);	
			}
			
			/*******************sidebar***********************/
			Work w = listService.selectWorkOne(wNo);
			request.setAttribute("w", w);
			
			int tepisode = listService.selectTepisode(wNo);
			request.setAttribute("tepisode", tepisode);
			
			/********************detail***********************/
			List<Work> cw = listService.selectCProductList(wNo);

			request.setAttribute("cw", cw);

	        // 전체리스트 개수
	        int listCnt = listService.selectProductCount(wNo);
			if(listCnt==0) {
				request.setAttribute("mw", null);
			}else {
		        Pagination pagination = new Pagination(listCnt, curPage);
		        List<Work> mw = listService.selectMProductList(wNo,pagination.getStartIndex(),pagination.getCurEndIndex());
				request.setAttribute("mw", mw);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main/worklist";
	}
	@RequestMapping(value="worklist_select/episode")
	public String workListEpisode(@RequestParam(defaultValue="1") int curPage,@RequestParam int wNo, @RequestParam int wdEpisode,HttpSession session, HttpServletRequest request) throws Exception{
		try {
			Integer userNo = (Integer)session.getAttribute("userNo");
			List<Bookmark> bmList = null ;
			
			if(userNo!=null) {
				bmList = mainService.selectByBookmark(userNo);
			}
			/*******************sidebar***********************/
			Work w = listService.selectWorkOne(wNo);
			request.setAttribute("w", w);
			
			int tepisode = listService.selectTepisode(wNo);
			request.setAttribute("tepisode", tepisode);
			
			/********************detail***********************/
			List<Work> cw = listService.selectCProductList(wNo);
			request.setAttribute("cw", cw);
			
			// 리스트 개수
			int listCnt = listService.selectProductCountByEpisode(wNo, wdEpisode);
			System.out.println(listCnt);
			
			if(listCnt==0) {
				request.setAttribute("mwe", null);
				System.out.println("호호");
			}else {
				//페이지 구하기
				Pagination pagination = new Pagination(listCnt, curPage);
		
				Map map = new HashMap();
				map.put("wNo", wNo);
				map.put("wdEpisode", wdEpisode);
				map.put("start",pagination.getStartIndex());
				map.put("end",pagination.getCurEndIndex());
				System.out.println(wdEpisode+"회차");
				    
			    List<Work> mwe = listService.selectMProductListByEpisode(map);
			    System.out.println(mwe);
			    
			    
			    System.out.println(pagination.getStartIndex()+"~"+pagination.getCurEndIndex());
		
			    int endPage = pagination.getEndPage();
			    
				request.setAttribute("mwe", mwe);
				request.setAttribute("endPage",endPage);
				request.setAttribute("userNo",userNo);
				request.setAttribute("bmList",bmList);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "main/worklist_episode";
	}


	/************Controller create_bookmark*******************/
	/*
	@RequestMapping("/create_bookmark")
	public String createBookmark(@RequestParam("userNo") int userNo, @RequestParam("pNo") int pNo) {
		try {
			//(Integer)request.getAttribute("");
			//String mNo = request.getParameter("mNo");
			Map map1 = new HashMap();
			//int mNo = (Integer)request.getAttribute("mNo");
			//int pNo = (Integer)request.getAttribute("pNo");
			System.out.println(userNo+" "+pNo);
			map1.put("mNo", userNo);
			map1.put("pNo", pNo);
			int success = listService.createBookmark(map1);
			System.out.println(success);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/main/index";
	}
	 */	
	/************Controller select_bookmark*******************/
	/*	
	@RequestMapping("/select_bookmark")
	public String selectBookmarkNo(@RequestParam int userNo, @RequestParam int pNo, HttpServletRequest request) {
		try {
			int bmNo = listService.selectBookmarkNo(userNo, pNo);
			request.setAttribute("bmNo", bmNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/main/delete_bookmark";
	}
	 */
}
   