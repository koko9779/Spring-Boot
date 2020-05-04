package com.itwill.staily.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object userId = session.getAttribute("userId");
		if(userId == null) {
			response.sendRedirect(request.getContextPath()+ "/login/login");
			return false;
		}
		return true;// true를 return해야 
        			// 다음 핸들러 혹은 인터셉터까지 요청 처리가 된다.
	}
}
