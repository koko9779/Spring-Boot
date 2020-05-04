package com.itwill.staily.detail.controller;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itwill.staily.detail.model.dto.ProductEx;
import com.itwill.staily.detail.service.ProductDetailService;
import com.itwill.staily.detail.service.WorkDetailService;
import com.itwill.staily.main.service.ListService;
import com.itwill.staily.main.service.MainService;
import com.itwill.staily.mypage.model.dto.Bookmark;
import com.itwill.staily.util.Work;
 
@Controller
@RequestMapping("/detail")
public class ProductDetailController {
	@Autowired
	private WorkDetailService workDetailService;
	@Autowired
	private ProductDetailService productDetailService;
	@Autowired
	private MainService mainService;
	@Autowired
	private ListService listService;
	
	@RequestMapping("/product_detail")
	public String selectProductOne(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		try {			
			Integer userNo = (Integer)session.getAttribute("userNo");
			request.setAttribute("userNo", userNo);
			
			String userId = (String)session.getAttribute("userId");
			request.setAttribute("userId", userId);
			
			String pNo = request.getParameter("pNo");
			String wNo = request.getParameter("wNo");
			
			if(userNo != null) {
				List<Bookmark> bmList = mainService.selectByBookmark(userNo);
				request.setAttribute("bmList", bmList);		
				
				if(productDetailService.bookmarkCheck(userNo, Integer.parseInt(pNo)) > 0) {
					Integer bmNo = (Integer)listService.selectBookmarkNo(userNo, Integer.parseInt(pNo));
					request.setAttribute("bmNo", bmNo);								
				}
			}
								   
			List<ProductEx> p = productDetailService.selectProductOne(Integer.parseInt(pNo));
			Work w = workDetailService.selectWorkOne(Integer.parseInt(wNo));
			productDetailService.increaseProductView(Integer.parseInt(pNo));
			workDetailService.increaseWorkView(Integer.parseInt(wNo));
			
			request.setAttribute("productOne", p);
			request.setAttribute("w", w);
			request.setAttribute("tepisode", w.getwTepisode());
			
			
			return "detail/product_detail";
		} catch (Exception e) {
			e.printStackTrace();
			
			return "redirect:../404";
		}
		
		
	}	

	@RequestMapping("/product_create")
	public ModelAndView product_create(HttpServletResponse response, HttpServletRequest request) {
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
	
	@RequestMapping("/product_create_action")
	public ModelAndView product_create_action(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		try {			
			
			Integer mNo = (Integer)session.getAttribute("userNo");
			String wNo = request.getParameter("wNo");
			String wdEpisode = request.getParameter("wdEpisode");
			String pName = request.getParameter("pName");
			String pPrice = request.getParameter("pPrice");
			String pUrl = request.getParameter("pUrl");
			String pAddress = request.getParameter("pAddress");
			String pDaddress = request.getParameter("pDaddress");
			String pScene = request.getParameter("filesize1");
			
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		    String pDate = df.format(new Date());
			
			String[] pdImage = request.getParameterValues("filesize3");
						
			ProductEx p = new ProductEx(mNo, Integer.parseInt(wNo), 
					pName, Integer.parseInt(pPrice), pUrl, pAddress, pDaddress, pScene, pDate);
			
			int companyChk = productDetailService.checkCompany(mNo);
			
			if(companyChk == 1) {
				productDetailService.createProductCompany(p, Integer.parseInt(wNo), Integer.parseInt(wdEpisode));
			}
			else {
				productDetailService.createProduct(p, Integer.parseInt(wNo), Integer.parseInt(wdEpisode));
			}
				
			productDetailService.createProductDetail(pdImage);				
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//mv.setViewName("work_request");
		mv.setViewName("redirect:..");
		
		return mv;		
	}	

	@RequestMapping("/product_delete")
	public ModelAndView product_delete(HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		try {			
			String pNo = request.getParameter("pNo");

			productDetailService.deleteProduct(Integer.parseInt(pNo));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("redirect:..");
		
		return mv;		
	}
	
	@RequestMapping("/upload")
	@ResponseBody
	public void upload(HttpServletResponse response, HttpServletRequest request, 
			@RequestParam("Filedata") MultipartFile Filedata) {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		String newfilename = df.format(new Date()) + Integer.toString((int) (Math.random()*10));
		//File f = new File("C:\\Users\\STU\\git\\Final-Project\\staily\\src\\main\\webapp\\images\\product\\scene\\" + newfilename + ".jpg"); 
		//File f = new File("C:\\Users\\Jacob\\git\\Final-Project\\staily\\src\\main\\webapp\\images\\product\\scene\\" + newfilename + ".jpg"); 
		//File f = new File("C:\\Users\\Home\\git\\Final-Project\\staily\\src\\main\\webapp\\images\\product\\scene\\" + newfilename + ".jpg"); 
		
		try {
			//String computerName = InetAddress.getLocalHost().getHostName();
			//String[] comName = computerName.split("-");
			String path = System.getProperty("user.name");
			
			String uploadPath = "C:\\Users\\" +  path + "\\" +  
					"/git/Final-Project/staily/src/main/webapp/images/product/scene/";
			
			File f = new File(uploadPath + newfilename + ".jpg");
			
			Filedata.transferTo(f); 
			response.getWriter().write(newfilename);
			
		} 
		catch (IllegalStateException | IOException e) { 
			e.printStackTrace(); 
		}
	}
	
	@RequestMapping("/upload2")
	@ResponseBody
	public void upload2(HttpServletResponse response, HttpServletRequest request, 
			@RequestParam("Filedata") MultipartFile Filedata) { 
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		String newfilename = df.format(new Date()) + Integer.toString((int) (Math.random()*10));
		//File f = new File("C:\\Users\\STU\\git\\Final-Project\\staily\\src\\main\\webapp\\images\\product\\image\\" + newfilename + ".jpg"); 
		//File f = new File("C:\\Users\\Jacob\\git\\Final-Project\\staily\\src\\main\\webapp\\images\\product\\image\\" + newfilename + ".jpg"); 
		//File f = new File("C:\\Users\\Home\\git\\Final-Project\\staily\\src\\main\\webapp\\images\\product\\image\\" + newfilename + ".jpg");
		
		try {
			//String computerName = InetAddress.getLocalHost().getHostName();
			//String[] comName = computerName.split("-");
			String path = System.getProperty("user.name");

			String uploadPath = "C:\\Users\\" +  path + "\\" +  
					"/git/Final-Project/staily/src/main/webapp/images/product/image/";
			File f = new File(uploadPath + newfilename + ".jpg");
			Filedata.transferTo(f); 
			response.getWriter().write(newfilename);
		} 
		catch (IllegalStateException | IOException e) { 
			e.printStackTrace(); 
		}
	}
	
	@RequestMapping("/pdScene_create")
	public String pdScene_create() {
		return "detail/pdScene_create";
	}	
	
	@RequestMapping("/pdScene_create_action")
	@ResponseBody
	public void pdScene_create_action(HttpServletRequest request, HttpServletResponse response) {
		try {		
			String pdScene = request.getParameter("filesize1");
			request.setAttribute("filesize1", pdScene);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	

	@RequestMapping("/pdImage_create")
	public String pdImage_create() {
		return "detail/pdImage_create";
	}
	
	@RequestMapping("/pdImage_create_action")
	@ResponseBody
	public void createProductDetail(HttpServletRequest request, HttpServletResponse response) {
		try {		
			String pdImage = request.getParameter("filesize2");
			request.setAttribute("filesize2", pdImage);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
}
