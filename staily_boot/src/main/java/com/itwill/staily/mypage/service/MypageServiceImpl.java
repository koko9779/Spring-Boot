package com.itwill.staily.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.staily.mypage.mapper.MypageMapper;
import com.itwill.staily.util.Company;
import com.itwill.staily.util.Member;
import com.itwill.staily.util.Product;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageMapper mypageMapper;
	
	@Override
	public Member selectOne(int mNo) throws Exception {
		return mypageMapper.selectOne(mNo);
	}

	@Override
	public boolean deleteMember(int mNo) throws Exception {
		return mypageMapper.deleteMember(mNo);
	}

	@Override
	public boolean updateMember(Member member) throws Exception {
		return mypageMapper.updateMember(member);
	}
	
	@Override
	public boolean updateMember(Member member, int coNo) throws Exception{
		boolean result = false;
		if(member.getmType()=="M") {
			result = mypageMapper.updateMember(member);
		}else if(member.getmType()=="C") {
			mypageMapper.updateMember(member);
			mypageMapper.updateCompanyNo(coNo, member.getmNo());
			result = true;
		}
		return result;
	}

	@Override
	public Member selectMemberCompany(int mNo) throws Exception {
		return mypageMapper.selectMemberCompany(mNo);
	}

	@Override
	public boolean updateCompanyNo(int coNo, int mNo) throws Exception {
		return mypageMapper.updateCompanyNo(coNo, mNo);
	}

	@Override
	public List<Product> selectWriteList(int mNo) throws Exception {
		return mypageMapper.selectWriteList(mNo);
	}

	@Override
	public boolean deleteWrite(int pNo) throws Exception {
		return mypageMapper.deleteWrite(pNo);
	}

}
