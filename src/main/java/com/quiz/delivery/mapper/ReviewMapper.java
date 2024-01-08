package com.quiz.delivery.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.quiz.delivery.domain.Review;

@Mapper
public interface ReviewMapper {
	
	public List<Review> selectReviewListByIdAndName(int storeId);
	
}
