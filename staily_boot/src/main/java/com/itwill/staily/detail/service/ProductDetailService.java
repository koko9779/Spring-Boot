package com.itwill.staily.detail.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.staily.detail.model.dto.ProductEx;

public interface ProductDetailService {
	public List<ProductEx> selectProductOne(int pNo) throws Exception;
	
	public boolean createProduct(ProductEx product, @Param("wNo") int wNo, 
			@Param("wdEpisode") int wdEpisode) throws Exception;
	
	public boolean createProductCompany(ProductEx product, @Param("wNo") int wNo, 
			@Param("wdEpisode") int wdEpisode) throws Exception;
	
	public boolean createProductDetail(String[] pdImage) throws Exception;
	
	public boolean updateProduct(ProductEx product) throws Exception;

	public boolean updateProductDetail(ProductEx product) throws Exception;

	public boolean deleteProduct(int pNo) throws Exception;
	
	public boolean deleteProductDetail(int pdNo) throws Exception;
	
	public int checkCompany(int mNo) throws Exception;
	
	public boolean increaseProductView(int pNo) throws Exception;
	
	public int bookmarkCheck(@Param("mNo") int mNo, @Param("pNo") int pNo) throws Exception;
	
}
