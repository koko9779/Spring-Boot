package com.itwill.staily.detail.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwill.staily.detail.model.dto.ProductEx;

@Mapper
public interface ProductDetailMapper {
	/*
	 * 트랜잭션이 필요한 메서드
	 * (상품 작성, 상품 상세 작성, 작품 상세 작성),
	 * 상품, 작품 조회수 증가, 댓글 추천 수, 신고 수 증가
	 * 댓글 작성, 댓글 삭제, 상품 삭제
	 */	
	
	public List<ProductEx> selectProductOne(int pNo);
	
	public boolean createProduct(ProductEx product);
	
	public boolean createProductCompany(ProductEx product);
	
	public boolean createProductDetail(String pdImage);
	
	public boolean updateProduct(ProductEx product);
	
	public boolean updateProductDetail(ProductEx product);
	
	public boolean deleteProduct(int pNo);
	
	public boolean deleteProductDetail(int pdNo);
	
	public int checkCompany(int mNo);
	
	public boolean increaseProductView(int pNo);

	public int bookmarkCheck(@Param("mNo") int mNo, @Param("pNo") int pNo);
}
