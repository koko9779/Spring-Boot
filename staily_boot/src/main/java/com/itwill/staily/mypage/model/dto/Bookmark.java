package com.itwill.staily.mypage.model.dto;

import com.itwill.staily.util.Member;
import com.itwill.staily.util.Product;

public class Bookmark {
	private int bmNo;			//북마크번호	 (PK)
	private Member member;		//멤버번호   m_no(FK)
	private Product product;	//상품번호   p_no(FK)
	
	public Bookmark() {
		
	}
	public Bookmark(int bmNo, Member member, Product product) {
		super();
		this.bmNo = bmNo;
		this.member = member;
		this.product = product;
	}

	public int getBmNo() {
		return bmNo;
	}

	public void setBmNo(int bmNo) {
		this.bmNo = bmNo;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Bookmark [bmNo=" + bmNo + ", member=" + member + ", product=" + product + "]";
	}
	
	
}
