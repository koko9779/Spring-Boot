package com.itwill.staily.mypage.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.staily.mypage.mapper.PaymentMapper;
import com.itwill.staily.mypage.model.dto.Payment;

@Service
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentMapper paymentMapper;
	
	@Override
	public Payment selectOne(int pyNo) throws Exception {
		return paymentMapper.selectOne(pyNo);
	}

	@Override
	public List<Payment> selectList(int mNo) throws Exception {
		return paymentMapper.selectList(mNo);
	}

	@Override
	public boolean createPayment(Payment payment) throws Exception {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String pyDate = df.format(new Date());
		payment.setPyDate(pyDate);
		return paymentMapper.createPayment(payment);
	}

	@Override
	public boolean updateCompanyY(int mNo) throws Exception {
		return paymentMapper.updateCompanyY(mNo);
	}

	@Override
	public boolean updateProductY(int mNo) throws Exception {
		return paymentMapper.updateProductY(mNo);
	}

	@Override
	public boolean updateCompanyN(int mNo) throws Exception {
		return paymentMapper.updateCompanyN(mNo);
	}

	@Override
	public boolean updateProductN(int mNo) throws Exception {
		return paymentMapper.updateProductN(mNo);
	}

	@Override
	public int checkN(int mNo) throws Exception {
		int result=0;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date day1 = new Date();				
		Date day2 = null;
		List<Payment> paymentList = selectList(mNo);
		int count = paymentList.size()-1;
		if(count == -1) {
			result = 0;
			return result;
		}
		day2 = dateFormat.parse(paymentList.get(count).getEndDate());
		int compare = day1.compareTo(day2);
		if(compare > 0) {
			updateCompanyN(mNo);
			updateProductN(mNo);
			result = 1;
			return result;
		}else {
			result = 2;
			return result;
		}
	}

	


}
