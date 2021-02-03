package com.example.demo.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class ElaspedTimeAspect {
	
	static final Logger logger = LoggerFactory.getLogger(ElaspedTimeAspect.class);

	@Around("execution(* com.example.demo.*.MemberService.*(..))")
	public Object logElaspedTimeAdvice(ProceedingJoinPoint pjp) throws Throwable{
		System.out.println("########## aop @Around 시작 ######");
			long begin = System.currentTimeMillis();
			Object retVal = pjp.proceed(); // 메서드 호출			
			
			System.out.println("########## aop @Around 종료==> 경과시간 ("+pjp.getSignature()+"): "+( System.currentTimeMillis() - begin));
		return retVal;
	}
	
	@Before("execution(* com.example.demo.*.MemberService.*(..))")
	public void before() {		
		System.out.println("########## aop @Before  call!! ############ ");
	}

	
	@After("execution(* com.example.demo.*.MemberService.*(..))")
	public void after() {		
		System.out.println("########## aop @After  call!! ############ ");
	}
	@AfterReturning("execution(* com.example.demo.*.MemberService.*(..))")
	public void afterReturning() {
		System.out.println("########## aop @AfterReturning  call!! ############ ");
	}
	
}
