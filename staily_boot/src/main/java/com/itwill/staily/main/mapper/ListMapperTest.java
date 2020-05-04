package com.itwill.staily.main.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.itwill.staily.detail.mapper.ProductDetailMapper;
import com.itwill.staily.detail.mapper.WorkDetailMapper;
import com.itwill.staily.util.Product;
import com.itwill.staily.util.Work;

public class ListMapperTest {

	public static void main(String[] args) throws Exception {
	ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/application-config.xml");
	ListMapper listM = applicationContext.getBean(ListMapper.class);
	WorkDetailMapper wdM = applicationContext.getBean(WorkDetailMapper.class);
	
	System.out.println("1-1.작품상세페이지 작품정보(작품이름,작품 포스터) 출력 ");
	
	Work work = wdM.selectWorkOne(1);
	System.out.println(work.getwPoster()+":"+work.getwName());
	System.out.println("----------------------------------------");
	
	System.out.println("1-2.총회차 출력");
	System.out.println(wdM.selectTepisode(1));
	System.out.println("----------------------------------------");
	
	System.out.println("2.작품상세페이지 상품리스트 출력(기업)");
	
	List<Work> w = listM.selectCProductList(1);
	List<Product> p = new ArrayList<Product>();
	
	for (int i = 0; i < w.size(); i++) {
		System.out.println("에피소드:"+w.get(i).getWdEpisode());
		p = w.get(i).getProduct();
		for (int j = 0; j < p.size(); j++) {
			System.out.println("product이름:"+p.get(j).getpName());
			System.out.println("장면(이미지):"+p.get(j).getpScene());
			System.out.println("작성자:"+p.get(j).getmId());
			System.out.println("조회수:"+p.get(j).getpView());
			System.out.println("관리자승인여부:"+p.get(j).getpCheck());
		}
	}
	System.out.println("3. 작품상세페이지 상품리스트 출력(일반)");
	
	List<Work> w1 = listM.selectCProductList(1);
	List<Product> p1 = new ArrayList<Product>();
	
	for (int i = 0; i < w1.size(); i++) {
		System.out.println("에피소드:"+w1.get(i).getWdEpisode());
		p1 = w1.get(i).getProduct();
		for (int j = 0; j < p1.size(); j++) {
			System.out.println("product이름:"+p1.get(j).getpName());
			System.out.println("product이름:"+p1.get(j).getpName());
			System.out.println("장면(이미지):"+p1.get(j).getpScene());
			System.out.println("작성자:"+p1.get(j).getmId());
			System.out.println("조회수:"+p1.get(j).getpView());
			System.out.println("관리자승인여부:"+p1.get(j).getpCheck());
		}
	}
	System.out.println("----------------------------------------");
	
	
	System.out.println("4.작품상세페이지 상품리스트 회차별 출력(기업)");
	Map map2 = new HashMap();
	map2.put("wNo", 1);
	map2.put("wdEpisode", 1);
	List<Work> w2 = listM.selectCProductListByEpisode(map2);
	List<Product> p2 = new ArrayList<Product>();
	
	for (int i = 0; i < w2.size(); i++) {
		System.out.println("에피소드:"+w2.get(i).getWdEpisode());
		p2 = w2.get(i).getProduct();
		for (int j = 0; j < p2.size(); j++) {
			System.out.println("product이름:"+p2.get(j).getpName());
			System.out.println("장면(이미지):"+p2.get(j).getpScene());
			System.out.println("작성자:"+p2.get(j).getmId());
			System.out.println("조회수:"+p2.get(j).getpView());
			System.out.println("관리자승인여부:"+p2.get(j).getpCheck());
			System.out.println();
		}
	}
	System.out.println("5.작품상세페이지 상품리스트 회차별 출력(일반)");
	Map map3 = new HashMap();
	map3.put("wNo", 1);
	map3.put("wdEpisode", 1);
	List<Work> w3 = listM.selectCProductListByEpisode(map3);
	List<Product> p3 = new ArrayList<Product>();
	
	for (int i = 0; i < w3.size(); i++) {
		System.out.println("에피소드:"+w3.get(i).getWdEpisode());
		p3 = w3.get(i).getProduct();
		for (int j = 0; j < p3.size(); j++) {
			System.out.println("product이름:"+p3.get(j).getpName());
			System.out.println("product이름:"+p3.get(j).getpName());
			System.out.println("장면(이미지):"+p3.get(j).getpScene());
			System.out.println("작성자:"+p3.get(j).getmId());
			System.out.println("조회수:"+p3.get(j).getpView());
			System.out.println("관리자승인여부:"+p3.get(j).getpCheck());
			System.out.println();
		}
	}
	System.out.println("----------------------------------------");
	
	/*
	System.out.println("6.즐겨찾기 등록");
	Map map = new HashMap();
	map.put("mNo", 2);
	map.put("pNo", 7);
	int result = listM.createBookmark(map);
	System.out.println(result);
	System.out.println("----------------------------------------");
	
	
	System.out.println("7.즐겨찾기 제거");
	int result1 = listM.deleteBookmark(1);
	System.out.println(result1);
	System.out.println("----------------------------------------");
	*/
	
	System.out.println("8.게시물 총 건수");
	int cnt = listM.selectProductCount(1);
	System.out.println(cnt);
	
	}
}
