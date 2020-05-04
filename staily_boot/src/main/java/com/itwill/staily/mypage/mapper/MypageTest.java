package com.itwill.staily.mypage.mapper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.itwill.staily.detail.mapper.WorkDetailMapper;
import com.itwill.staily.main.mapper.ListMapper;
import com.itwill.staily.mypage.model.dto.Bookmark;
import com.itwill.staily.mypage.model.dto.Friend;
import com.itwill.staily.mypage.model.dto.Message;
import com.itwill.staily.mypage.model.dto.Payment;
import com.itwill.staily.util.Company;
import com.itwill.staily.util.Member;
import com.itwill.staily.util.Product;
import com.itwill.staily.util.Work;

public class MypageTest {
	public static void main(String[] args) throws Exception{
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/application-config.xml");
		BookmarkMapper bk = applicationContext.getBean(BookmarkMapper.class);
		MypageMapper mp = applicationContext.getBean(MypageMapper.class);
		MessageMapper ms = applicationContext.getBean(MessageMapper.class);
		FriendMapper fm = applicationContext.getBean(FriendMapper.class);
		PaymentMapper pm = applicationContext.getBean(PaymentMapper.class);
		
		/*
		Payment p = pm.selectOne(1);
		
		//System.out.println(p.getmNo()+","+p.getPyName()+","+p.getPyPeriod()+","+p.getPyPrice());
		
		Payment p2 = new Payment(0, 7, 2500, null, "25일이용권", 25, "C");
		
		//System.out.println(pm.createPayment(p2));
		
		//System.out.println(pm.updateCompanyN(3));
		//System.out.println(pm.updateProductY(3));
		
		List<Payment> paymentList = pm.selectList(7);
		for (Payment payment : paymentList) {
			System.out.println(payment.getmNo()+","+payment.getPyName()+","+payment.getPyPeriod()+","+payment.getPyPrice());
		}
		*/
		
		
		
		
		
		
		
		//MypageService
		
		/***********************MYpage**********************************************
		Member m = mp.selectOne(5);
		System.out.println(m.getmId()+m.getmName()+m.getmNo()+m.getmType());
		m.setmName("수수정정");
		m.setmId("수수정수정");
		
		System.out.println(mp.updateMember(m));
		System.out.println(m.getmId()+m.getmName()+m.getmNo()+m.getmType());
		
		Member m2 = mp.selectMemberCompany(1);
		//System.out.println(m2.getmNo()+","+m2.getmId()+","+m2.getmType()+","+m2.getmCompany().getCoCheck());
		//System.out.println(mp.deleteMember(22));
		
		//List<Product> writeList = mp.selectWriteList(1);
		//for (Product product : writeList) {
		//	System.out.println(product.getpNo()+","+product.getPdScene()+","+product.getpName()+","+product.getmId());
		//}
		//System.out.println("-----");
		
		//Company c = new Company(1,2222,"Y");
		//System.out.println(mp.updateCompanyNo(3333,3));
		/************************************************************************/
		
		
		
		/*********************************Friend**************************************/
		System.out.println(fm.findFriend("hiphopmy"));
		//System.out.println(fm.deleteFriend(9));
		//Friend f = new Friend(2, 3);
		System.out.println(fm.createFriend(2,7));
		//List<Friend> friendList = fm.selectList(1);
		//for (Friend friend : friendList) {
		//	System.out.println(friend.getfPk()+","+friend.getmNo()+","+friend.getfNo()+","+friend.getmName());
		//}
		/******************************************************************************/
		
		/*****************************Message****************************************
		List<Message> messageList = ms.selectMessageList(2);
		for (Message message : messageList) {
			System.out.println(message.getMsNo()+","+message.getmNo()+","+message.getMsTitle()+","+message.getmId());
		}
		//insert into message (ms_no, m_no, ms_title, ms_content, ms_date) 
		//values (MESSAGE_NO_SEQ.nextval,#{mNo},#{msTitle},#{msContent},sysdate)	
		Message m = new Message(0,2,"제목4","안녕4",null);
		//ms.createMessage(m);
		System.out.println(ms.deleteMessage(6));
		****************************************************************************/
		
		/******************Bookmark***********************************
		List<Bookmark> bookmarkList1 = bk.selectList(1);
		for (Bookmark bookmark : bookmarkList1) {
			System.out.println(bookmark.getBmNo()+","+bookmark.getMember().getmId()+","+
						 	   bookmark.getProduct().getPdScene()+","+bookmark.getProduct().getpName());
		}
		System.out.println(bk.deleteBookmark(3));
		
		List<Bookmark> bookmarkList2 = bk.selectList(1);
		for (Bookmark bookmark : bookmarkList2) {
			System.out.println(bookmark.getBmNo()+","+bookmark.getMember().getmId()+","+
						 	   bookmark.getProduct().getPdScene()+","+bookmark.getProduct().getpName());
		}
		*****************************************************************/
		
		
		
		
		
	}

}
