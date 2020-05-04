package com.itwill.staily.login.interceptor;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.itwill.staily.admin.model.Stats;
import com.itwill.staily.admin.service.StatsService;

public class VisitTimeInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private StatsService st;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession httpSession = request.getSession();
        //접속 브라우저
        String agent = request.getHeader("User-Agent");
        String browser = null;
        if (agent != null) {
           if (agent.indexOf("Trident") > -1) {
              browser = "MSIE";
           } else if (agent.indexOf("Chrome") > -1) {
              browser = "Chrome";
           } else if (agent.indexOf("Opera") > -1) {
              browser = "Opera";
           } else if (agent.indexOf("iPhone") > -1 && agent.indexOf("Mobile") > -1) {
              browser = "iPhone";
           } else if (agent.indexOf("Android") > -1 && agent.indexOf("Mobile") > -1) {
              browser = "Android";
           }
        }
        //접속 아이피
        String ip = request.getHeader("X-Forwarded-For");
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        //유입경로 확인
        String Referer  =request.getHeader("referer");
        if(Referer == null || Referer =="") {
        	Referer = "new";
        }
        //접속 시간
        String time = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        //중복체크
        String sessionid= request.getRequestedSessionId();
        if (httpSession.getAttribute("sessionId") == null) {
            httpSession.setAttribute("sessionId", sessionid);
            Stats stats = new Stats(0, ip, time, Referer , browser);
            st.createStats(stats);
            System.out.println(ip+"<아이피"+time+"<접속시간"+Referer+"<접속경로"+browser+"<브라우저");
        }
        return true; // true를 return해야 
                     // 다음 핸들러 혹은 인터셉터까지 요청 처리가 된다.
    }
}