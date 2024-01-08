package com.quiz.lesson04.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson04.domain.Seller;

@Mapper
public interface SellerMapper {
	
	public int insertSeller(
			@Param("nickname") String nickname,
			@Param("profileImgUrl") String profileImgUrl,
			@Param("temperature") double temperature);
	
	public Seller selectLatestSeller();
	
	public Seller selectSellerById(int id);
}
