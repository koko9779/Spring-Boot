package com.itwill.staily.detail.mapper;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.itwill.staily.detail.model.dto.ProductEx;
import com.itwill.staily.detail.model.dto.Reply;
import com.itwill.staily.detail.service.ProductDetailServiceImpl;
import com.itwill.staily.detail.service.ReplyServiceImpl;
import com.itwill.staily.detail.service.WorkDetailServiceImpl;
import com.itwill.staily.util.Product;
import com.itwill.staily.util.Work;

@SuppressWarnings("unused")
public class ServiceTest {

	public static void main(String[] args) throws Exception {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/application-config.xml");
		ProductDetailServiceImpl pdm = applicationContext.getBean(ProductDetailServiceImpl.class);
		ReplyServiceImpl rm = applicationContext.getBean(ReplyServiceImpl.class);
		WorkDetailServiceImpl wdm = applicationContext.getBean(WorkDetailServiceImpl.class);
		
		//댓글 단위 테스트
		//List<Reply> replyList = rm.selectReplyList(1);
		//System.out.println(replyList);
		
		//Reply rp = rm.selectReplyOne(10);
		//System.out.println(rp);
		
		//boolean create = rm.createReply(new Reply(1, 1, "test", 3, 0));
		//System.out.println(create);
		
		//boolean delete = rm.deleteReply(2, 1, 1);
		//System.out.println(delete);
		
		//boolean inc = rm.increaseRecommend(10);
		//System.out.println(inc);
		
		//boolean inc = rm.increaseReport(10);
		//System.out.println(inc);

		//boolean create = rm.createFriend(3, 6);
		//System.out.println(create);
		
		//상품 단위 테스트
		//List<ProductEx> product = pdm.selectProductOne(1);
		//System.out.println(product);
    
		//boolean create = pdm.createProduct(new ProductEx(1, 5, "테스트1", 123456, "ㅇㄴ", "경기도", "고양시", "Y", 25, "ㅇㅇ"));
		//System.out.println(create);
		
		//boolean create = pdm.createProductDetail(new ProductEx(4, "신난다"));
		//System.out.println(create);
		
		//boolean update = pdm.updateProduct(new ProductEx("테슷트", 1500000, "google.com", "서울", "시", "N", 345362, "ㅇㅇ", 4));
		//System.out.println(update);
		
		//boolean update = pdm.updateProductDetail(new ProductEx("이메지", 33));
		//System.out.println(update);
		
    //boolean inc = pdm.increaseProductView(3);
    //System.out.println(inc);
		
		//int check = pdm.checkCompany(7);
		//System.out.println(check);
		
		//작품 단위 테스트
    //Work work = wdm.selectWorkOne(3);
    //System.out.println(work);
		
    //List<Work> wL = wdm.selectWorkAll();
    //System.out.println(wL.size());
		
		//boolean create = wdm.createWorkDetail(21, 3, 10);
		//System.out.println(create);
		
    //int sel = wdm.selectTepisode(1);
    //System.out.println(sel);
		
		((ConfigurableApplicationContext)applicationContext).close();

	}
}
