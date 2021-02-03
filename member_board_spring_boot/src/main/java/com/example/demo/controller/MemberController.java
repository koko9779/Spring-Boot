package com.example.demo.controller;

import java.net.http.HttpRequest;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.configuration.CustomProperty;
import com.example.demo.dto.Member;
import com.example.demo.mgr.MemberService;


@Controller
public class MemberController {
	
	final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CustomProperty customConfig;
	
	@Value("${custom.welcome}")
	private String welcome;
	
	@Value("${custom.goodbye}")
	private String goodBye;
	
	@Autowired
	MemberService memberService;
	
	
	/////////////////////////// example ///////////////////////////////////////////	
	@RequestMapping(value = "/main" )
	public String hello() {
		logger.info("customConfig==> {}",customConfig.welcome);
		logger.info("customConfig==> {}",customConfig.goodbye);		
		logger.info("value ==> {}",welcome);
		logger.info("value ==> {}",goodBye);
		return "hello.jsp";
	}
	
	
	@PostMapping(value = "/modelAttribute")
	public String modelAttribute(Model model, @ModelAttribute Member dto){
	        // @ModelAttribute는 Form태그를 통해 전송받은 파라미터들을 Java 객체로 매핑시킨다.
	        logger.info("id :{}", dto.getId());
	        logger.info("name :{}", dto.getName());
	        model.addAttribute("member", memberService.getMember(dto.getId()+""));
	        return "member/getMember";
	}

	
	
	/////////////////////////////////회원 관련 간단한 예제/////////////////////////////////////
	
	/*
	 * 로그인 페이지
	 */
	@RequestMapping("/login")
	public String loginForm(HttpSession session) {
		//로그인상태라면 boardList 페이지로
    	String userId = (String) session.getAttribute("userId");
		if(userId != null) {
			return "redirect:/boardList";
		}
		return "member/loginForm";
	}
	
	/*
	 * 로그인 처리
	 */
	@RequestMapping(value="/loginPost", method = RequestMethod.POST)
	public String loginPost(HttpServletRequest req , HttpSession session) throws Exception{
		
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		
		//로그인 체크
		Member member = memberService.loginCheck(id, password);
		
		//로그인 성공
		if(member != null) {	
			session.setAttribute("userId", id);
			session.setAttribute("name", member.getName());
			return "redirect:/boardList";
		}
		//로그인 실패
		else {
			session.setAttribute("errMsg","가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
			return "redirect:/login";	
		}	
	}
	
	/*
	 * 로그아웃
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req){
		HttpSession session = req.getSession();
		//세션 초기화
		if(session != null) memberService.logout(session); 
		return "redirect:/boardList";
	}
	
	/*
	 * 회원가입 페이지
	 */
	@RequestMapping("/MemberForm")
	public String memberForm() {		
		return "member/MemberForm";
	}
	
	/*
	 * 회원가입 처리
	 */
	@RequestMapping(value = "/memberJoinProc", method = RequestMethod.POST)
	public String insertMember(@ModelAttribute Member member) throws Exception{		
		logger.info("member ======> {}", member.getName());		
				
		member.setBirth(stringToDate(member));
		member.setMail(member.getMail1()+"@"+member.getMail2());
			
		memberService.insertMember(member);
		return "redirect:/login";
	}

	/*
	 * 회원 리스트
	 */
	@GetMapping("/getMemberList")
	public ModelAndView getMemberList(ModelAndView mav) throws Exception{		
		List<Member> memberList =  memberService.getMemberList();
		mav.setViewName("member/getMemberList");
		mav.addObject("memberList", memberList);		
		return mav;
	}
	
	/*
	 * 회원 유무 판단
	 */
	@ResponseBody
	@GetMapping("/getMemberCount")
	public int getMemberCount(@RequestParam("id") String id) throws Exception{		
		logger.info("id ==> {}",id);
		int count = memberService.getMemberCount(id);
		return count;
	}
	
	/*
	 * 날짜 포멧 맞추기
	 */
	 public Date stringToDate(Member member)
    {
        String year = member.getBirthyy();
        String month = member.getBirthmm();
        String day = member.getBirthdd();	        
        Date birthday = Date.valueOf(year+"-"+month+"-"+day);	        
        return birthday;
        
    } // end stringToDate()
	    
//	/*
//	 * 회원 디테일 페이지
//	 */
//	@ResponseBody
//	@GetMapping("/getMember")
//	public ModelAndView getMember(@RequestParam("id") String id, ModelAndView mav) throws Exception{		
//		logger.info("id ==> {}",id);
//		Member member = memberService.getMember(id);
//		mav.setViewName("member/getMember");
//		mav.addObject("member", member);		
//		return mav;
//	}
		
	
}
