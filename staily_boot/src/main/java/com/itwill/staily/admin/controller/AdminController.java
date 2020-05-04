
package com.itwill.staily.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.itwill.staily.admin.model.Stats;
import com.itwill.staily.admin.service.AdminService;
import com.itwill.staily.admin.service.StatsService;
import com.itwill.staily.mypage.model.dto.Message;
import com.itwill.staily.util.Board;
import com.itwill.staily.util.Member;
import com.itwill.staily.util.Product;
import com.itwill.staily.util.Work;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private StatsService statsService;
	@Autowired
	ServletContext servletContext;
	public AdminController() {
		
	}
	/*
	 * 만들어야할거... 회원 ,작품, 상품 수정 form(아에 form.jsp도 만들어야함) action 삭제 action들
	 * 
	 */
	
	@RequestMapping("/main")
	public String adminMain(HttpServletRequest request) throws Exception {
		List<Product>productList= adminService.selectPopProduct();
		List<Work>workList=adminService.selectPopWork();
		List<Board>boardList=adminService.popularBoard();
		int count = adminService.countUnconfirm();
		request.setAttribute("productList", productList);
		request.setAttribute("workList", workList);
		request.setAttribute("boardList", boardList);
		request.setAttribute("count", count);
		return "admin/index";
	}
	@RequestMapping("/stats")
	@ResponseBody
	public JSONObject adminStats(@RequestParam("stTime")String stTime,HttpServletRequest request) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		List<Stats> statsList = new ArrayList();
		statsList= statsService.selectTime(stTime);
		result.put("result", statsList);
		JSONObject json = new JSONObject(result);	
		return json;
	}
	@RequestMapping("/stats_browser")
	@ResponseBody
	public JSONObject adminStatsBrowser(HttpServletRequest request) throws Exception {
		Map<String, Object> browser = new HashMap<String, Object>();
		List<Stats> statsList = new ArrayList();
		statsList= statsService.selectBrowser();
		browser.put("browser", statsList);
		JSONObject json = new JSONObject(browser);	
		return json;
	}
	@RequestMapping("/calendar")
	public String adminCalendar() {
		return "admin/calendar";
	}
	// 회원
	@RequestMapping("/member")
	public String memberAdminForm(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Member> memberList = new ArrayList();
			memberList = adminService.selectMemberAll();
			request.setAttribute("data", memberList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/member";
	}

	@RequestMapping("/member_delete")
	@ResponseBody
	public String memberAdminDelete(@RequestParam("mNo") int mNo, HttpServletRequest request) {
		String result = "fail";
		try {
			adminService.deleteMember(mNo);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}

	@RequestMapping("/member_select")
	public String memberAdminUpdate(HttpServletRequest request) {
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		Member member = null;
		try {
			member = adminService.selectMemberOne(mNo);
			String phn = member.getmPhone();
			String phn1 = phn.substring(0,3);
			String phn2 = phn.substring(3,7);
			String phn3 = phn.substring(7);
			request.setAttribute("phn1", phn1);
			request.setAttribute("phn2", phn2);
			request.setAttribute("phn3", phn3);
			request.setAttribute("member", member);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/member_update";
	}

	@RequestMapping(value = "/member_update", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String memberAdminUpdateA(@RequestParam("mNo") int mNo, @RequestParam("mId") String mId,
			@RequestParam("mPw") String mPw, @RequestParam("mName") String mName,
			@RequestParam("mAddress") String mAddress, @RequestParam("mDaddress") String mDaddress,
			@RequestParam("mEmail") String mEmail, @RequestParam("mType") String mType, HttpServletRequest request) {
		String phn1 = request.getParameter("phn1");
		String phn2 = request.getParameter("phn2");
		String phn3 = request.getParameter("phn3");
		String mPhone = phn1 + phn2 + phn3;
		Member member = new Member(mNo, mId, mPw, mName, mAddress, mDaddress, mEmail, mType, mPhone);
		String result = "";
		try {
			boolean updateOk = adminService.updateMember(member);
			if (updateOk) {
				result = "success";
			} else {
				result = "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}
	@RequestMapping("/create_message")
	public String messageAdmin() {
		return "admin/create_message";
	}
	@RequestMapping("/create_message_action")
	@ResponseBody
	public String messageAdminAction(@RequestParam("msTitle")String msTitle,@RequestParam("msContent")String msContent,
									  HttpServletRequest request) throws Exception {
		String result = "";
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String msDate = df.format(new Date());
		List<Member> memberNo= adminService.selectMemberAll();
		try {
			for (Member member : memberNo) {
				int rNo = member.getmNo();
				Message message = new Message(1, msTitle, msContent,msDate, rNo);
				adminService.createMessage(message);
			}
			result="success";
		} catch (Exception e) {
			e.printStackTrace();
			result="fail";
		}
		return result;
	}
	
	// 상품
	@RequestMapping("/product")
	public String productAdminForm(HttpServletRequest request) {
		try {
			List<Product> productList = new ArrayList();
			productList = adminService.selectProductAll();
			request.setAttribute("data", productList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/product";
	}

	@RequestMapping("/product_select")
	public String productAdminSelect(@RequestParam int pNo, HttpServletRequest request) {
		try {
			List<Product> productList = new ArrayList();
			productList = adminService.selectProductOne(pNo);
			request.setAttribute("productList", productList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/product_update";
	}

	@RequestMapping("/product_update_scene")
	public String productAdminScene(@RequestParam("pScene")String scene,HttpServletRequest request, HttpSession session) {
		try {
			session.setAttribute("pScene", scene);
			session.removeAttribute("pdImage");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/product_update_img";
	}
	@RequestMapping("/product_update_img")
	public String productAdminImage(@RequestParam("pdImage")String img,HttpServletRequest request, HttpSession session) {
		try {
			session.setAttribute("pdImage", img);
			session.removeAttribute("pScene");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/product_update_img";
	}

	@RequestMapping(value = "/update_img")
	public void upDate(HttpServletResponse response, HttpServletRequest request,
			@RequestParam("Filedata") MultipartFile Filedata) throws Exception {
		HttpSession session = request.getSession();
		String newfilename = "";
		String path = "";
		String pScene =(String) session.getAttribute("pScene");
		String pdImage =(String) session.getAttribute("pdImage");
		String userName = System.getProperty("user.name");
		if(pScene !=null && pScene!="") {
			newfilename= pScene;
			path = "scene";
		}else {
			newfilename = pdImage;
			path = "image";
		}
		File f = new File("C:\\Users\\"+userName+"\\git\\Final-Project\\staily\\src\\main\\webapp\\images\\product\\"+path+"\\" + newfilename + ".jpg"); 
		try {
			Filedata.transferTo(f); 
			response.getWriter().write(newfilename);
		} 
		catch (IllegalStateException | IOException e) { 
			e.printStackTrace(); 
		}
	}

	@RequestMapping("/product_update")
	@ResponseBody
	public String productAdminUpdate(@RequestParam("pNo") int pNo, @RequestParam("mNo") int mNo,
			@RequestParam("wNo") int wNo, @RequestParam("pName") String pName, @RequestParam("pPrice") int pPrice,
			@RequestParam("pURL") String pUrl, @RequestParam("pAddress") String pAddress,
			@RequestParam("pDaddress") String pDaddress, @RequestParam("pCheck") String pCheck,
			@RequestParam("pView") int pView, @RequestParam("pDate") String pDate,
			@RequestParam("pScene") String pScene) {
		Product product = new Product(pNo, mNo, wNo, pName, pPrice, pUrl, pAddress, pDaddress, pCheck, pView, pDate,
				pScene);
		String result = "";
		try {
			adminService.updateProduct(product);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping(value = "/product_confirm", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String productAdminConfirm(@RequestParam("pNo") int pNo, HttpServletRequest request) {
		String result = "";
		try {
			boolean confirmOk = adminService.productConfirm(pNo);
			if (confirmOk) {
				result = "success";
			} else {
				result = "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}
	
	@RequestMapping(value = "/product_reject", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String productAdminReject(@RequestParam("rNo") int rNo, HttpServletRequest request) {
		String result = "";
		try {
			Message message = new Message(1, "상품승인이 거부되었습니다", "부적합한 상품으로 확인되어 상품 등록이 거절되었습니다.", rNo);
			boolean rejectOk= adminService.rejectMessage(message);
			if (rejectOk) {
				result = "success";
			} else {
				result = "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}

	@RequestMapping("/product_delete")
	@ResponseBody
	public String productAdminDelete(@RequestParam("pNo") int pNo, HttpServletRequest request) {
		String result = "fail";
		try {
			adminService.deleteProduct(pNo);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}

	// 작품
	@RequestMapping("/work")
	public String workAdminForm(HttpServletRequest request) {
		try {
			List<Work> workList = new ArrayList();
			workList = adminService.selectWorkAll();
			request.setAttribute("data", workList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/work";
	}

	// TMDB API 검색창
	@RequestMapping("/work_seach")
	public String workAPISeacher() {
		return "admin/work_search";
	}

	@RequestMapping(value = "/work_create")
	public String workAdminCreate(@RequestParam("wName") String wName, @RequestParam("wCategory") String wCategory,
			@RequestParam("wDate") String wDate, @RequestParam("wPoster") String wPoster,
			@RequestParam("wOverview") String wOverview, HttpServletRequest request) {
		Work work = new Work(0, wName, wCategory, wDate, wPoster, 0, 0);
		request.setAttribute("work", work);
		request.setAttribute("wOverview", wOverview);
		return "admin/work_create";
	}

	@RequestMapping("/work_create_action")
	@ResponseBody
	public String workAdminCreateAction(@RequestParam("wName") String wName,
			@RequestParam("wCategory") String wCategory, @RequestParam("wDate") String wDate,
			@RequestParam("wPoster") String wPoster, @RequestParam("wTepisode") int wTepisode,
			HttpServletRequest request) {
		String wVideo= "FWbeu4nVwvg";
		Work work = new Work(0, wName, wCategory, wDate, wPoster, wTepisode, 0,wVideo);
		String result = "";
		try {
			adminService.createWork(work);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}

	@RequestMapping("/work_select")
	public String workAdminSelect(@RequestParam("wNo") int wNo, HttpServletRequest request) {
		Work work = null;
		try {
			work = adminService.selectWorkOne(wNo);
			request.setAttribute("work", work);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/work_update";
	}

	@RequestMapping(value = "/work_update", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String workAdminUpdate(@RequestParam("wName") String wName, @RequestParam("wCategory") String wCategory,
			@RequestParam("wDate") String wDate, @RequestParam("wPoster") String wPoster,
			@RequestParam("wTepisode") int wTepisode, @RequestParam("wView") int wView, @RequestParam("wNo") int wNo,
			HttpServletRequest request) {
		String wVideo= "FWbeu4nVwvg";
		Work work = new Work(wNo, wName, wCategory, wDate, wPoster, wTepisode, wView,wVideo);
		String result = "";
		try {
			boolean updateWork = adminService.updateWork(work);
			if (updateWork) {
				result = "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}
	@RequestMapping("/work_delete")
	@ResponseBody
	public String workAdminDelete(HttpServletRequest request, @RequestParam("wNo")int wNo) throws Exception {
		String result = "";
		try {
			boolean deleteOk = adminService.deleteWork(wNo);
			result ="success";
		} catch (Exception e) {
			e.printStackTrace();
			result ="fail";
		}
		return result;
	}
	/*********************************기타*************************************/
	@RequestMapping("/notice")
	public String noticeMain(HttpServletRequest request)throws Exception{
		List<Board>noticeList = new ArrayList();
		noticeList = adminService.selectBoardAll();
		request.setAttribute("data", noticeList);
		return "admin/notice/notice_read";
	}
	@RequestMapping("/notice_create")
	public String noticeCreate(HttpServletRequest request)throws Exception{
		return "admin/notice/notice_create";
	}
	@RequestMapping(value = "/notice_create_action", method = RequestMethod.POST)
	public String style_create_action_post(@ModelAttribute Board board, HttpSession session) {
		String forwardPath = "";
		try {
			board.setmNo(1);
			adminService.createNotice(board);
			forwardPath = "redirect:/admin/notice";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forwardPath;
	}
	@RequestMapping("/notice_detail")
	public String noticeDetail(HttpServletRequest request,@RequestParam("bNo")int bNo) throws Exception {
		Board board = adminService.selectBoardOne(bNo);
		request.setAttribute("board", board);
		return"admin/notice/notice_detail";
	}
	@RequestMapping("/notice_delete")
	@ResponseBody
	public String noticeDelete(HttpServletRequest request,@RequestParam("bNo")int bNo) {
		String result ="";
		try {
			adminService.deleteNotice(bNo);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}
	@RequestMapping(value="/imgUpload")
	public void fileUpload(HttpServletRequest req, HttpServletResponse resp, 
                 MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		OutputStream out2 = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null){
			if(file.getSize() > 0 ){
				if(file.getContentType().toLowerCase().startsWith("image/")){
					try{
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						
						//서버에 올릴 경로
						String uploadPath = req.getSession().getServletContext().getRealPath("/img");
						
						//workspace 경로
						String userName = System.getProperty("user.name");
						String uploadPath2 = "C:/Users/"+userName+"/git/Final-Project/staily/src/main/webapp/img";
						
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()){
							uploadFile.mkdirs();
						}
						
						// 파일명 생성
						SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
   						fileName = df.format(new Date()) + Integer.toString((int) (Math.random()*10));
						uploadPath = uploadPath + "/" + fileName;
						uploadPath2 = uploadPath2 + "/" + fileName;
						//파일이 들어갈 경로를 넣고 
						out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);
                        out2 = new FileOutputStream(new File(uploadPath2));
                        out2.write(bytes);
                        
                        printWriter = resp.getWriter();
                        resp.setContentType("text/html");
                        String fileUrl = req.getContextPath() + "/img/" + fileName;
                        
                        System.out.println(fileUrl);
                        
                        // json 데이터로 등록
                        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                        // 이런 형태로 리턴이 나가야함.
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        
                        printWriter.println(json);
                    }catch(IOException e){
                        e.printStackTrace();
                        
                    }finally{
                    	 if(out2 != null){
                             out2.close();
                         }
                        if(printWriter != null){
                            printWriter.close();
                        }
					}
				}
			}
		}
	}	
}

