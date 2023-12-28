package com.quiz.delivery.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.delivery.domain.Review;

@Repository
public interface ReviewMapper {
	
	public List<Review> selectReviewListByIdAndName(int storeId);
	
}
