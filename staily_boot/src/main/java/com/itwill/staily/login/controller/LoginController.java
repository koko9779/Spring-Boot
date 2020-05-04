package com.itwill.staily.login.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.itwill.staily.admin.service.NaverLogin;
import com.itwill.staily.login.exception.NoExistedIdException;
import com.itwill.staily.login.exception.NoSearchMemberException;
import com.itwill.staily.login.exception.PasswordMissmatchException;
import com.itwill.staily.login.service.LoginService;
import com.itwill.staily.login.service.NaverLogin2;
import com.itwill.staily.mypage.service.PaymentService;
import com.itwill.staily.util.Company;
import com.itwill.staily.util.Member;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private LoginService loginService;

	
	public LoginController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "/login")
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLogin클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLogin2.getAuthorizationUrl(session); //세션에다가 난수로 생성한 state값을 넣는 작업
//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
//네이버
		model.addAttribute("url", naverAuthUrl);
		return "login/login";
	}
	
	
	@RequestMapping(value = "/logout_action")
	public String logout_action(HttpSession session) {
		session.invalidate();
		return "redirect:/main/index";
	}
	
	@RequestMapping(value = "/id_read")
	public String id_read() {
		return "login/id_read";
	}
	
	
	@RequestMapping(value = "/pw_count_read")
	public String pw_read() {
		return "login/pw_count_read";
	}
	
	@RequestMapping(value = "/pw_count_read_action", method = RequestMethod.GET)
	public String pw_count_read_action_get() {
		return "login/pw_count_read";
	}
	
	@RequestMapping(value = "/pw_count_read_action", method = RequestMethod.POST)
	public String pw_count_read_action_post(@RequestParam String id, String phone, Model model) {
		String forwardPath = "";
		
		try {
			loginService.isIdExistForPw(id, phone);
			model.addAttribute("id", id);
			forwardPath = "login/pw_update";
		}catch(NoSearchMemberException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			forwardPath = "login/pw_count_read";
		}catch(Exception e) {
			e.printStackTrace();
			forwardPath = "redirect:/404.jsp";
		}
		return forwardPath;
	}
	
	@RequestMapping(value = "/pw_update", method = RequestMethod.GET)
	public String update_pw_get() {
		return "login/pw_count_read";
	}
	
	@RequestMapping(value = "/pw_update", method = RequestMethod.POST)
	public String update_pw_post(@RequestParam String id, String pw) {
		String forwardPath = "";
		Member updateMember = new Member();
		updateMember.setmId(id);
		updateMember.setmPw(pw);
		
		try {
			loginService.updatePw(updateMember);
			forwardPath = "login/login";
		} catch(Exception e) {
			e.printStackTrace();
			forwardPath = "redirect:/404.jsp";
		}
		return forwardPath;
	}
	
	
	@RequestMapping(value = "/member_create")
	public String member_create() {
		return "login/member_create";
	}
	
	/***************************************
	 * Naver
	 *****************************************/
	/* NaverLogin */
	private NaverLogin2 naverLogin2;
	private String apiResult = null;

	@Autowired
	private void setNaverLogin(NaverLogin2 naverLogin2) {
		this.naverLogin2 = naverLogin2;
	}

//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/naver", method = { RequestMethod.GET, RequestMethod.POST })
	public String login_naver(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLogin클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLogin2.getAuthorizationUrl(session); //세션에다가 난수로 생성한 state값을 넣는 작업
//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
//네이버
		model.addAttribute("url", naverAuthUrl);
		return "login/Naver_login2";
	}
	/*
	 * 콜백 url을 controller 매핑으로 만들어서, 거기에 로그인 사용자의 정보가 있으면 session에 넣어주면 되는건가..
	 */

//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback");
		
		String forwardPath;
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLogin2.getAccessToken(session, code, state);
//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLogin2.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 
		 * {"resultcode":"00", 
		 * "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
//3. 데이터 파싱
//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
//response에서 필요한 데이터 추출
		String id = (String) response_obj.get("id");
		System.out.println(id);
//4.파싱 닉네임 세션으로 저장
		/*
		session.setAttribute("sessionId", nickname); // 세션 생성
		model.addAttribute("result", apiResult);
		*/
		//jsonObj 의 값 중에 message를 통해 성공했는지 아닌지 판별하여 다른 로직을 실행
		String message = (String)jsonObj.get("message");
		if(message.equals("success")) {
			// 카운터 네이버아이디 타입 N
			int idCount = loginService.naverIdCounter((String)response_obj.get("id"));
			
			//1
			//메인페이지 세션 회원정보 one

			
			//0
			// 회원가입 폼 넘기기  회원가입 추가 정보 회원가입폼
			
			
			forwardPath = "";
		} else {
			forwardPath = "redirect:/login/login";
		}
		return forwardPath;
	}

//로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();
		return "redirect:index.jsp";
	}
	
	
	
	
	
}  
