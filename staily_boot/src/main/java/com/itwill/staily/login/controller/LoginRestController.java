package com.itwill.staily.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.staily.login.exception.NoExistedIdException;
import com.itwill.staily.login.exception.NoSearchMemberException;
import com.itwill.staily.login.exception.PasswordMissmatchException;
import com.itwill.staily.login.service.LoginService;
import com.itwill.staily.mypage.service.PaymentService;
import com.itwill.staily.util.Company;
import com.itwill.staily.util.Member;

@RestController
@RequestMapping("/login")
public class LoginRestController {
	@Autowired
	private LoginService loginService;
	@Autowired
	private PaymentService paymentService;
	
	@PostMapping(value = "/login_action", produces = "application/json")
	public Map<String, Object> login_action_post(@RequestParam String userId, 
												  String userPw, 
												  HttpSession session) {
		int result = -999;
		Member member = new Member();
		Member successMember;
		member.setmId(userId);
		member.setmPw(userPw);
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			successMember = loginService.login(member);
			int mNo = successMember.getmNo();
			session.setAttribute("userId", successMember.getmId());
			session.setAttribute("userNo", mNo);
			session.setAttribute("userType", successMember.getmType());
			
			if(successMember.getmType().equals("C")) {
				result = paymentService.checkN(mNo);
				map.put("success", "success");
				map.put("mType", successMember.getmType());
				map.put("result", result); // 1이면 기간만료 메세지 출력
			}else {
				map.put("success", "success");
				map.put("mType", successMember.getmType());
			}
		} catch (NoExistedIdException e) {
			e.printStackTrace();
			map.put("success", "fail");
			map.put("msg", e.getMessage());
		} catch (PasswordMissmatchException e) {
			map.put("success", "fail");
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@PostMapping(value = "/id_read_action", produces = "application/json")
	public Map find_id_action_post(@RequestParam String name, String phone) {
		String findId = "";
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			
			findId = loginService.findId(phone, name);
			map.put("success", "success");
			map.put("id", findId);
			
			//forwardPath = "login/login";
		} catch(NoSearchMemberException e) {
			e.printStackTrace();
			map.put("success", "fail");
			map.put("customError", true);
			map.put("msg", e.getMessage());
			//forwardPath = "login/id_read";
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", "fail");
			map.put("customError", false);
			//forwardPath = "redirect:/404.jsp";
		}
		return map;
	}
	
	@RequestMapping(value = "/Id_check", produces = "application/json", method = RequestMethod.POST)
	public int Id_check(@RequestParam String mId) throws Exception {
		return loginService.isExistedId(mId);
	}
	
	@RequestMapping(value = "/email_check", produces = "application/json")
	public int email_check(@RequestParam String mEmail) throws Exception {
		return loginService.isEmailExist(mEmail);
	}
	
	@RequestMapping(value = "/member_create_action", method = RequestMethod.POST)
	public int member_create_action_post(@ModelAttribute Member signupMember, String coNo, Model model) {
		int resultCount = -99;
		
		try {
			if(signupMember.getmType().equals("M")) {
				resultCount = loginService.signUpMember(signupMember);
			}else if(signupMember.getmType().equals("C")) {
				Company com = new Company();
				int intCoNo = Integer.parseInt(coNo);
				com.setCoNo(intCoNo);
				
				signupMember.setmCompany(com);
				resultCount = loginService.signUpCompany(signupMember);
			}
		}catch(Exception e) {
			e.printStackTrace();
			resultCount = 0;
		}
		return resultCount; 
	}
	
	
}
