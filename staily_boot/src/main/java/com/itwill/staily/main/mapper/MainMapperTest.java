
package com.itwill.staily.main.mapper;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.itwill.staily.mypage.model.dto.Bookmark;
import com.itwill.staily.util.Product;
import com.itwill.staily.util.Work;

public class MainMapperTest {

	public static void main(String[] args) throws Exception {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/application-config.xml");
		MainMapper mainM = applicationContext.getBean(MainMapper.class);
		
		System.out.println("1. 즐겨찾기한 상품 출력");
		List<Bookmark> bmList = mainM.selectByBookmark(2);
		for (Bookmark bm : bmList) {
			System.out.println("bmNo="+bm.getBmNo()+", mNo="+bm.getMember().getmNo()+", pNo="+bm.getProduct().getpNo()
							   +":"+bm.getProduct().getpName()+","+bm.getProduct().getpScene());
		}
		System.out.println("----------------------------------------");	
		
		System.out.println("2. HOT 상품 출력");
		List<Product> productList = mainM.selectByView();
		for (Product product : productList) {
			System.out.println("["+product.getpNo()+":"+product.getpName()+","+product.getpView()+","+product.getpScene()+"]");
		}
		System.out.println("----------------------------------------");
		
		System.out.println("3.오늘의 작품찾기");
		List tw = mainM.selectTodayOfWork();
		System.out.println(tw.size());
		for (Object o: tw) {
			System.out.println(o);
		}
		System.out.println("----------------------------------------");
		
		System.out.println("4. 카테고리 = 드라마인 작품 출력하기");
		List<Work> workList = mainM.selectByCategory("d");
		for (Work work : workList) {
			System.out.println("["+work.getwNo()+":"+work.getwCategory()+","+work.getwPoster()+"]");
		}
		System.out.println("----------------------------------------");
		

		/*
		mainServiceImpl ms = applicationContext.getBean(mainServiceImpl.class);
		
		List<Bookmark> bmList1 = ms.selectByBookmark(2);
		for (Bookmark bm : bmList1) {
			System.out.println("["+bm.getBmNo()+","+bm.getMember().getmNo()+","+bm.getProduct().getpNo()+":"
								+bm.getProduct().getpName()+","+bm.getProduct().getPdScene()+"]");
		}
		*/
		
	}
	
}


