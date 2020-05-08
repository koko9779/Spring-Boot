package com.itwill.staily.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.staily.mypage.model.dto.Payment;
@Mapper
public interface PaymentMapper {
	
	//결제 하나 선택
	public Payment selectOne(int pyNo) throws Exception;
	
	//결제 리스트 출력
	public List<Payment> selectList(int mNo) throws Exception;
	
	//결제 추가
	public boolean createPayment(Payment payment) throws Exception;
	
	//결제 후 company Y변경
	public boolean updateCompanyY(int mNo) throws Exception;
	
	//결제 후 product Y변경
	public boolean updateProductY(int mNo) throws Exception;
	
	//종료 후 company N변경
	public boolean updateCompanyN(int mNo) throws Exception;
	
	//종료 후 product N변경
	public boolean updateProductN(int mNo) throws Exception;
}
