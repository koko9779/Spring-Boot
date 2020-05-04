package com.itwill.staily.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter{
   
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      String userType = "";
      
      HttpSession session = request.getSession();
      userType = (String)session.getAttribute("userType");
      if(userType == null || !userType.equals("A")) {
         response.sendRedirect(request.getContextPath()+ "/main/index");
         return false;
      }
      return true;// true를 return해야 
                 // 다음 핸들러 혹은 인터셉터까지 요청 처리가 된다.
   }
}